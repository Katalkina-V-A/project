class RequestsController < ApplicationController
  before_action :check_level_five, only: [:update, :edit]
  before_action :check_admin, only: [:destroy]
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.ordering.page(params[:page])
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to @request, notice: 'Ваша заявка принята.'
    else
      render :new
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    if @request.update(request_params)
      redirect_to @request, notice: 'Параметры изменены.'
    else
      render :edit
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    if @request.destroy
      redirect_to requests_url, notice: 'Заявка удалена.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:employee_id, :historymove_id, :content, :status, :dateapp, :dateanswer, :answer)
    end
end
