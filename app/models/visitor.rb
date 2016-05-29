class Visitor < ActiveRecord::Base
  belongs_to :person, -> { ordering }
  accepts_nested_attributes_for :person

  has_many :visitortenants
  has_many :tenants, through: :visitortenants
  accepts_nested_attributes_for :visitortenants, allow_destroy: true

  DOCUMENTS = [['Паспорт',0], ['Водительское удостоверение',1], ['Пропуск',2], ['Студенческий билет',3]]

  scope :ordering, -> { order("updated_at DESC") }

  validates :person_id, uniqueness: {scope: [:document, :numb]}
  validates :document, uniqueness: {scope: :numb}
  validates :numb, presence: true
end
