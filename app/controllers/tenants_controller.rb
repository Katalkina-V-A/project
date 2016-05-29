class TenantsController < ApplicationController
  before_action :check_level_five

  def index
    if @current_user.try(:is_admin?)
      @tenants = Tenant.page(params[:page])
    else
      array = @current_user.client.buildings.ids
      @tenants = Tenant.joins(rooms: [:building]).where(rooms: {building_id: array}).distinct.ordering.page(params[:page])
    end
  end
end
