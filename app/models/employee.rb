class Employee < ActiveRecord::Base
  has_attached_file :avatar, styles: {large: "500x500", medium: "250x250>", thumb: "100x100>"}
  validates_attachment :avatar, content_type: {content_type: /\Aimage\/.*\z/}
  belongs_to :person, -> { ordering }
  accepts_nested_attributes_for :person

  has_one :user, as: :client
  # validates_presence_of :user
  accepts_nested_attributes_for :user

  has_many :requests

  has_many :buildingemployees
  has_many :buildings, through: :buildingemployees
  accepts_nested_attributes_for :buildingemployees, allow_destroy: true

  scope :ordering, -> { includes(:buildings).order("buildings.id").includes(:person).order("people.lastname") }
  validates :person_id, uniqueness: true
end
