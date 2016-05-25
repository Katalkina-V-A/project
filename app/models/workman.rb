class Workman < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :person
  accepts_nested_attributes_for :person

  has_one :tenant, as: :resident
  has_many :relatives, as: :kin
  validates :person_id, uniqueness: true
end
