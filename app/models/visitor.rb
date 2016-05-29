class Visitor < ActiveRecord::Base
  belongs_to :person, -> { ordering }
  validates_presence_of :person
  accepts_nested_attributes_for :person

  has_many :visitortenants
  has_many :tenants, through: :visitortenants
  validates_presence_of :visitortenants
  accepts_nested_attributes_for :visitortenants, allow_destroy: true

  DOCUMENTS = [['Паспорт',0], ['Водительское удостоверение',1], ['Пропуск',2], ['Студенческий билет',3]]

  scope :ordering, -> { joins(:visitortenants).order("visitortenants.created_at DESC") }

  validates :person_id, uniqueness: {scope: [:document, :numb]}
  validates :document, uniqueness: {scope: :numb}
  validates :numb, presence: true
end
