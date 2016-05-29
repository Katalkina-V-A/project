class VisitorsController < ApplicationController
  before_action :check_level_six, only: [:index, :show]
  before_action :check_level_seven, only: [:new, :create, :edit, :update]
  before_action :check_admin, only: [:destroy]
  before_action :set_visitor, only: [:show, :edit, :update, :destroy]

  # GET /visitors
  # GET /visitors.json
  def index
    if @current_user.try(:is_admin?)
      @visitors = Visitor.ordering.page(params[:page])
    elsif !@current_user.try(:is_tenant?)
      array = @current_user.client.buildings.ids
      @visitors = Visitor.joins(tenants: [rooms: [:building]]).where(rooms: {building_id: array}).distinct.ordering.page(params[:page])
    elsif @current_user.try(:is_tenant?)
      @visitors = Visitor.joins(:tenants).where("visitortenants.tenant_id = :q",
      q: @current_user.client.id).ordering.page(params[:page])
    end
  end

  # GET /visitors/1
  # GET /visitors/1.json
  def show
  end

  # GET /visitors/new
  def new
    @visitor = Visitor.new
    @visitor.person = Person.new
    @visitor.visitortenants.build
  end

  # GET /visitors/1/edit
  def edit
  end

  # POST /visitors
  # POST /visitors.json
  def create
    @visitor = Visitor.new(visitor_params)

    if @visitor.save
      redirect_to @visitor, notice: 'Посетитель зарегистрирован.'
    else
      render :new
    end
  end

  # PATCH/PUT /visitors/1
  # PATCH/PUT /visitors/1.json
  def update
    if @visitor.update(visitor_params)
      redirect_to @visitor, notice: 'Параметры изменены.'
    else
      render :edit
    end
  end

  # DELETE /visitors/1
  # DELETE /visitors/1.json
  def destroy
    if @visitor.destroy
      redirect_to visitors_url, notice: 'Посетитель удален.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor
      @visitor = Visitor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_params
      params.require(:visitor).permit(:person_id, :document, :numb, person_attributes: [:lastname,
          :firstname, :secondname, :birthday, :sex],
          visitortenants_attributes: [:id, :_destroy, :tenant_id, :visitor_id, :arrivaldate,
            :arrivaltime, :leavetime, :note])
    end
end
