class Guest < ActiveRecord::Base
  belongs_to :person

  has_one :tenant, as: :resident
  accepts_nested_attributes_for :tenant

  has_many :relatives, as: :kin

  validates :person_id, uniqueness: true
end
