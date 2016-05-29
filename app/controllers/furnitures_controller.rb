class FurnituresController < ApplicationController
  before_action :check_level_one, only: [:show]
  before_action :check_level_two, only: [:index, :edit, :create, :new, :update]
  before_action :check_admin, only: [:destroy]
  before_action :set_furniture, only: [:show, :edit, :update, :destroy]

  # GET /furnitures
  # GET /furnitures.json
  def index
    if @current_user.try(:is_commandant?)
      array = @current_user.client.buildings.ids
      @furnitures = Furniture.where(building_id: array).order(:building_id).ordering.page(params[:page])
    elsif @current_user.try(:is_admin?)
      @furnitures = Furniture.ordering.page(params[:page])
    end
  end

  # GET /furnitures/1
  # GET /furnitures/1.json
  def show
  end

  # GET /furnitures/new
  def new
    @furniture = Furniture.new
  end

  # GET /furnitures/1/edit
  def edit
  end

  # POST /furnitures
  # POST /furnitures.json
  def create
    @furniture = Furniture.new(furniture_params)

    if @furniture.save
      redirect_to @furniture, notice: 'Мебель добавлена в базу.'
    else
      render :new
    end
  end

  # PATCH/PUT /furnitures/1
  # PATCH/PUT /furnitures/1.json
  def update
    if @furniture.update(furniture_params)
      redirect_to @furniture, notice: 'Параметры изменены.'
    else
      render :edit
    end
  end

  # DELETE /furnitures/1
  # DELETE /furnitures/1.json
  def destroy
    if @furniture.destroy
      redirect_to furnitures_url, notice: 'Мебель удалена из базы.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_furniture
      @furniture = Furniture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def furniture_params
      params.require(:furniture).permit(:building_id, :name, :quantity, :size, :note)
    end
end
