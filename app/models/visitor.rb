class Visitor < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :person
  accepts_nested_attributes_for :person
  has_many :visitortenants
  has_many :tenants, through: :visitortenants
  DOCUMENTS = [['Паспорт',0], ['Водительское удостоверение',1], ['Пропуск',2], ['Студенческий билет',3]]
  scope :ordering, -> { includes(:person).order("people.lastname") }
  validates :person_id, uniqueness: {scope: [:document, :numb]}
  validates :document, uniqueness: {scope: :numb}
end
