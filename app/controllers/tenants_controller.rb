class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]

  # GET /tenants
  # GET /tenants.json
  def index
    @tenants = Tenant.page(params[:page])
  end

  # GET /tenants/1
  # GET /tenants/1.json
  def show
  end

  # GET /tenants/new
  def new
    @tenant = Tenant.new
  end

  # GET /tenants/1/edit
  def edit
  end

  # POST /tenants
  # POST /tenants.json
  def create
    @tenant = Tenant.new(tenant_params)
    person = @tenant.resident.person
    if @tenant.save || person.save
      redirect_to @tenant, notice: 'Комната создана.'
    else
      render :new
    end
  end

  # PATCH/PUT /tenants/1
  # PATCH/PUT /tenants/1.json
  def update
    if @tenant.update(tenant_params)
      redirect_to @tenant, notice: 'Комната изменена.'
    else
      render :edit
    end
  end
  def select_tenants_type
    if params.has_key?(:id)
      @tenant = Tenant.find(params[:id])
    else
      @tenant = Tenant.new
      @tenant_type = params[:tenant_type]
      if params[:tenant_type] == '1'
        workman = Workman.new
        workman.build_person
        @tenant.resident = workman
      elsif params[:tenant_type] == '2'
        guest = Guest.new
        guest.build_person
        @tenant.resident = guest
      elsif params[:tenant_type] == '3'
        relative = Relative.new
        relative.build_person
        @tenant.resident = relative
      elsif params[:tenant_type] == '0'
        student = Student.new
        student.build_person
        @tenant.resident = student
      end
    end
    respond_to do |format|
      format.js {
      }
    end
  end
  # DELETE /tenants/1
  # DELETE /tenants/1.json
  def destroy
    if @tenant.destroy
      redirect_to tenants_url, notice: 'Комната удалена.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_params
      params.require(:tenant).permit(:security, :phone, :arrivaldate, :checkoutdate,
      :note, :resident_id, :resident_type,
        workman_attributes: [:person_id, :placejob, :post, :phone,
        {person_attributes: [:lastname, :firstname, :secondname, :birthday, :sex]}],

        student_attributes: [:person_id, :faculty, :typegroup, :group, :course, :chair,
        :receiptdate, :expirationdate, {person_attributes: [:lastname,
        :firstname, :secondname, :birthday, :sex]}],

        guest_attributes: [:person_id, :cause, {person_attributes: [:lastname,
        :firstname, :secondname, :birthday, :sex]}],

        relative_attributes: [:person_id, :relationship, {person_attributes: [:lastname,
        :firstname, :secondname, :birthday, :sex]}])
    end
end
