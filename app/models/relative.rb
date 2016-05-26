class Relative < ActiveRecord::Base
  belongs_to :person

  belongs_to :kin, polymorphic: true
  has_one :tenant, as: :resident
  accepts_nested_attributes_for :tenant

  validates :person_id, uniqueness: true
end
