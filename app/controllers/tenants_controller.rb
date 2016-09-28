class TenantsController < ApplicationController
  before_action :check_level_five

  def index
    # if @current_user.try(:is_admin?) || @current_user.try(:is_commandant?)
      # if params[:search]

        @tenants = Tenant.includes(resident: [:person]).group_by{|t| t.resident.person.lastname[0]}.sort
    # else
    #   array = @current_user.client.buildings.ids
    #   @tenants = Tenant.joins(rooms: [:building]).where(rooms: {building_id: array}).distinct.ordering.page(params[:page])
    # end
  end
end
