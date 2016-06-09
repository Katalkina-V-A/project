class Relative < ActiveRecord::Base
  belongs_to :person, -> { ordering }

  belongs_to :kin, polymorphic: true

  has_one :tenant, as: :resident
  accepts_nested_attributes_for :tenant
  scope :ordering, -> { includes(:person).order("people.lastname") }

  validates :person_id, uniqueness: true
  # validates :relationship, presence: true
end
