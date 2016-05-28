class TenantsController < ApplicationController
  before_action :check_level_five

  def index
    @tenants = Tenant.page(params[:page])
  end
end
