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
    @tenant = Tenant.find(params[:id])
  end

  # POST /tenants
  # POST /tenants.json
  def create
    @tenant = Tenant.new(tenant_params)

    if @tenant.save
      redirect_to @tenant, notice: 'Жилец создана.'
    else
      render :new
    end
  end

  # PATCH/PUT /tenants/1
  # PATCH/PUT /tenants/1.json
  def update
    if @tenant.update(tenant_params)
      redirect_to @tenant, notice: 'Жилец изменена.'
    else
      render :edit
    end
  end

  # def select_tenants_type
  #   if params.has_key?(:id)
  #     @tenant = Tenant.find(params[:id])
  #   else
  #     @tenant = Tenant.new
  #     @tenant_type = params[:tenant_type]
  #     if params[:tenant_type] == '1'
  #       @tenant.workman = Workman.new
  #     elsif params[:tenant_type] == '2'
  #       @tenant.guest = Guest.new
  #     elsif params[:tenant_type] == '3'
  #       @tenant.relative = Relative.new
  #     elsif params[:tenant_type] == '0'
  #       @tenant.student = Student.new
  #     end
  #
  #   end
  #
  #   respond_to do |format|
  #     format.js {
  #     }
  #   end
  # end

  # DELETE /tenants/1
  # DELETE /tenants/1.json
  def destroy
    if @tenant.destroy
      redirect_to tenants_url, notice: 'Жилец удалена.'
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
      :note)
        # workman_attributes: [:person_id, :placejob, :post, :phone, {person_attributes:
        # [:lastname, :firstname, :secondname, :birthday, :sex]}],
        #
        # student_attributes: [:person_id, :faculty, :typegroup, :group, :course,
        # :receiptdate, :expirationdate, :chair, :note, {person_attributes: [:lastname,
        # :firstname, :secondname, :birthday, :sex]}],
        #
        # guest_attributes: [:person_id, :cause, {person_attributes: [:lastname,
        # :firstname, :secondname, :birthday, :sex]}],
        #
        # relative_attributes: [:person_id, :relationship,  {person_attributes: [:lastname,
        # :firstname, :secondname, :birthday, :sex]}])
    end
end
