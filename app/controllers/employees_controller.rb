class EmployeesController < ApplicationController
  before_action :check_admin, except: [:show, :index]
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    if params[:search]
      @employees = Buildingemployee.joins(employee: [:person]).includes(:building).search(params[:search]).group_by{|b| b.building_id}
    elsif params[:char]
      # @employees = Buildingemployee.select(:building_id,:employee_id).distinct.joins(employee: [:person]).search_char(params[:char]).includes(:building).group_by{|b| b.building_id}
      @employees = Buildingemployee.joins(employee: [:person]).search_char(params[:char]).includes(:building).group_by{|b| b.building_id}
    else
      @employees = Buildingemployee.joins(employee: [:person]).order("lastname").group_by{|b| b.building_id}
    end
    # page(params[:page])
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.person = Person.new
    @employee.build_user
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    if @employee.save

      redirect_to @employee, notice: 'Сотрудник добавлен в базу.'
    else
      render :new
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Параметры изменены.'
    else
      render :edit
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    if @employee.destroy
      redirect_to employees_url, notice: 'Сотрудник удален из базы.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:person_id, :avatar,
      person_attributes: [:id, :lastname, :firstname, :secondname, :birthday, :sex],
      user_attributes: [:password, :password_confirmation, :activation_state,:id, :email, :role, :client_id, :client_type],
      buildingemployees_attributes: [:id, :_destroy, :building_id, :post, :employee_id,
      :cabinet, :phone, :startwork, :endwork, :note])
    end
end
