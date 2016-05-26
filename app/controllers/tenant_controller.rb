class TenantController < ApplicationController
  def index
    @tenants = Tenant.page(params[:page])
  end
end
