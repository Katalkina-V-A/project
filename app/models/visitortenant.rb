class Visitortenant < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :visitor
  validates :tenant_id, :arrivaldate, :arrivaltime, presence: true
  validates :tenant_id, uniqueness: {scope: [:visitor_id, :arrivaldate]}
end
