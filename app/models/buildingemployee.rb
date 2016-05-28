class Buildingemployee < ActiveRecord::Base
  belongs_to :employee
  belongs_to :building

  validates :building_id, presence: true
  validates :building_id, uniqueness: {scope: [:employee_id, :post]}
end
