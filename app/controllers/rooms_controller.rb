class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy, :add]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.ordering.page(params[:page])
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
      redirect_to @room, notice: 'Комната создана.'
    else
      render :new
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    if @room.update(room_params)
      redirect_to @room, notice: 'Комната изменена.'
    else
      render :edit
    end
  end

  def add
    # @furnitureinrooms = Furnitureinrooms.where(room_id: @room)
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    if @room.destroy
      redirect_to rooms_url, notice: 'Комната удалена.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:building_id, :numb, :floor, :section, :place,
      :typeroom, :state, :fire, :signal, :samospas, :accessory, :accessoryfaculty,
      :note, furnitureinrooms_attributes: [:room_id, :building_id, :quantity, :furniture_id])
    end
end
