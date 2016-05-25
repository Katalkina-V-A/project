class Employee < ActiveRecord::Base

  belongs_to :person
  validates_presence_of :person
  accepts_nested_attributes_for :person

  has_many :requests
  has_many :buildingemployees, dependent: :destroy
  has_many :buildings, through: :buildingemployees
  scope :ordering, -> { includes(:person).order("people.lastname") }
  validates :person_id, uniqueness: true
end
