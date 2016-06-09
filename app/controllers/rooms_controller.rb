class RoomsController < ApplicationController
  before_action :check_level_five, only: [:index]
  before_action :check_level_two, only: [:edit, :update, :add]
  before_action :check_admin, only: [:new, :create, :destroy]
  before_action :set_room, only: [:show, :edit, :update, :destroy, :add]
  before_action :check_tenant, only: [:show]

  # GET /rooms
  # GET /rooms.json
  def index
    if @current_user.try(:is_admin?)
      if params[:build]
        @rooms = Room.where(building_id: params[:build]).ordering.page(params[:page])
      else
        @rooms = Room.order(:building_id).ordering.page(params[:page])
      end
    else
      array = @current_user.client.buildings.ids
      @rooms = Room.where(building_id: array).order(:building_id).ordering.page(params[:page])
    end
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room, notice: 'Комната добавлена в базу.'
    else
      render :new
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    if @room.update(room_params)
      redirect_to @room, notice: 'Параметры изменены.'
    else
      render params[:formname]
    end
  end

  def add
    # @furnitureinrooms = Furnitureinrooms.where(room_id: @room)
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    if @room.destroy
      redirect_to rooms_url, notice: 'Комната удалена из базы.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end
    def check_tenant
      render_error unless User.edit_tenant?(@current_user, nil, @room)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:building_id, :numb, :floor, :section, :place,
      :typeroom, :state, :fire, :signal, :samospas, :accessory, :accessoryfaculty,
      :note, furnitureinrooms_attributes: [:id, :_destroy, :room_id, :quantity, :furniture_id], files: [])
    end
end
