class Relative < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :person
  accepts_nested_attributes_for :person

  belongs_to :kin, polymorphic: true
  has_one :tenant, as: :resident
  
  validates :person_id, uniqueness: true
end
