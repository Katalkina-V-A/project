class Guest < ActiveRecord::Base
  belongs_to :person, -> { ordering }

  has_one :tenant, as: :resident
  validates_presence_of :tenant
  accepts_nested_attributes_for :tenant

  has_many :relatives, as: :kin
  scope :ordering, -> { includes(:person).order("people.lastname") }

  validates :person_id, uniqueness: true
  validates :cause, presence: true
end
