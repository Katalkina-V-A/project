class BuildingsController < ApplicationController
  before_action :check_admin, except: [:index, :show]
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = Building.ordering.page(params[:page])
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
  end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to @building, notice: 'Корпус создан.'
    else
      render :new
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    if @building.update(building_params)
      redirect_to @building, notice: 'Корпус изменен.'
    else
      render :edit
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    if @building.destroy
      redirect_to buildings_url, notice: 'Корпус удален.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_params
      params.require(:building).permit(:name, :address, :numb, :typebuild, :floor, :state, :quantityroom, :note)
    end
end
