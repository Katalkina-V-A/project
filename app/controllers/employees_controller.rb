class EmployeesController < ApplicationController
  before_action :check_admin, except: [:show, :index]
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.ordering.page(params[:page])
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.person = Person.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee, notice: 'Сотрудник создана.'
    else
      render :new
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Сотрудник изменена.'
    else
      render :edit
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    if @employee.destroy
      redirect_to employees_url, notice: 'Сотрудник удалена.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:person_id,
      person_attributes: [:id, :lastname, :firstname, :secondname, :birthday, :sex],
      buildingemployees_attributes: [:id, :_destroy, :building_id, :post, :employee_id,
      :cabinet, :phone, :startwork, :endwork, :note])
    end
end