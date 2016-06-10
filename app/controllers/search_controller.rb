class SearchController < ApplicationController
  def index
    if params[:post]
      @employees = Employee.joins(:buildingemployees).where("upper(post) like upper(:q)", q: "%#{params[:post]}%")
    else
      @employees = nil
    end
  end
end
