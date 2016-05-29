class Employee < ActiveRecord::Base
  belongs_to :person, -> { ordering }
  accepts_nested_attributes_for :person

  has_one :user, as: :client
  # validates_presence_of :user
  accepts_nested_attributes_for :user

  has_many :requests

  has_many :buildingemployees
  has_many :buildings, through: :buildingemployees
  accepts_nested_attributes_for :buildingemployees, allow_destroy: true

  scope :ordering, -> { includes(:person).order("people.lastname") }
  validates :person_id, uniqueness: true

end
