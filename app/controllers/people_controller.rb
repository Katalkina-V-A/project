class PeopleController < ApplicationController
  before_action :check_level_eight, only: [:update, :edit]
  before_action :check_level_four, only: [:addlinen]
  before_action :check_level_two, only: [:new, :addroom]
  before_action :check_admin, only: [:destroy]
  before_action :set_person, only: [:show, :edit, :update, :destroy, :addroom, :addlinen]

  # GET /people
  # GET /people.json

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person, notice: 'Жилец добавлен в базу.'
    else
      render :new
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    if @person.update(person_params)
      redirect_to @person, notice: 'Параметры изменены.'
    else
      render params[:formname]
    end
  end

  def select_tenants_type
    if params.has_key?(:id)
      @person = Person.find(params[:id])
    else
      @person = Person.new
      @tenant_type = params[:tenant_type]
      if params[:tenant_type] == '1'
        @person.build_workman.build_tenant.build_user
      elsif params[:tenant_type] == '2'
        @person.build_guest.build_tenant.build_user
      elsif params[:tenant_type] == '3'
        @person.build_relative.build_tenant.build_user
      elsif params[:tenant_type] == '0'
        @person.build_student.build_tenant.build_user
      end
    end
    respond_to do |format|
      format.js {
      }
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    if @person.destroy
      redirect_to people_url, notice: 'Жилец удален из базы.'
    end
  end

  def addroom

  end
  def addlinen

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:lastname, :firstname, :secondname, :birthday, :sex,
        workman_attributes: [:id, :person_id, :placejob, :post, :phone,
        {tenant_attributes: [:id, :security, :phone, :arrivaldate, :checkoutdate,
      :note, :resident_id, :resident_type, {
        user_attributes: [:id, :email, :role, :client_id, :client_type],
        historymoves_attributes: [:id, :_destroy, :tenant_id, :room_id, :datein, :dateout, :note],
        linenattenants_attributes: [:id, :_destroy, :tenant_id, :linen_id, :quantity]}]}],

        student_attributes: [:id, :person_id, :faculty, :typegroup, :group, :course, :chair,
        :receiptdate, :expirationdate, {tenant_attributes: [:id, :security, :phone, :arrivaldate, :checkoutdate,
      :note, :resident_id, :resident_type, {user_attributes: [:id, :email, :role, :client_id, :client_type],
          historymoves_attributes: [:id, :_destroy, :tenant_id, :room_id, :datein, :dateout, :note],
          linenattenants_attributes: [:id, :_destroy, :tenant_id, :linen_id, :quantity]}]}],

        guest_attributes: [:id, :person_id, :cause,{tenant_attributes: [:id, :security, :phone, :arrivaldate, :checkoutdate,
      :note, :resident_id, :resident_type, {user_attributes: [:id, :email, :role, :client_id, :client_type],
          historymoves_attributes: [:id, :_destroy, :tenant_id, :room_id, :datein, :dateout, :note],
          linenattenants_attributes: [:id, :_destroy, :tenant_id, :linen_id, :quantity]}]}],

        relative_attributes: [:id, :person_id, :relationship, :kin_id, :kin_type, {tenant_attributes: [:id, :security, :phone, :arrivaldate, :checkoutdate,
      :note, :resident_id, :resident_type, {user_attributes: [:id, :email, :role, :client_id, :client_type],
          historymoves_attributes: [:id, :_destroy, :tenant_id, :room_id, :datein, :dateout, :note],
          linenattenants_attributes: [:id, :_destroy, :tenant_id, :linen_id, :quantity]}]}]
        )
    end
end
