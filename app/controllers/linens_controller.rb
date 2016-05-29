class LinensController < ApplicationController
  before_action :check_level_three, only: [:show, :index]
  before_action :check_level_four, only: [:edit, :create, :new, :update]
  before_action :check_admin, only: [:destroy]
  before_action :set_linen, only: [:show, :edit, :update, :destroy]

  # GET /linens
  # GET /linens.json
  def index
    @linens = Linen.ordering.page(params[:page])
  end

  # GET /linens/1
  # GET /linens/1.json
  def show
  end

  # GET /linens/new
  def new
    @linen = Linen.new
  end

  # GET /linens/1/edit
  def edit
  end

  # POST /linens
  # POST /linens.json
  def create
    @linen = Linen.new(linen_params)

    if @linen.save
      redirect_to @linen, notice: 'Белье добавлено в базу.'
    else
      render :new
    end
  end

  # PATCH/PUT /linens/1
  # PATCH/PUT /linens/1.json
  def update
    if @linen.update(linen_params)
      redirect_to @linen, notice: 'Параметры изменены.'
    else
      render :edit
    end
  end

  # DELETE /linens/1
  # DELETE /linens/1.json
  def destroy
    if @linen.destroy
      redirect_to linens_url, notice: 'Белье удалено из базы.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linen
      @linen = Linen.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def linen_params
      params.require(:linen).permit(:building_id, :name, :quantity, :size, :note)
    end
end
