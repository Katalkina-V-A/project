class Student < ActiveRecord::Base
  belongs_to :person, -> { ordering }

  has_one :tenant, as: :resident

  accepts_nested_attributes_for :tenant
  scope :ordering, -> { includes(:person).order("people.lastname") }
  has_many :relatives, as: :kin

  FACULTIES = [['Автоматики',0], ['Безопасности',1], ['Вечерний',2], ['Кибернетики',3], ['Теоретической физики',4], ['Экспериментальной физики',5], ['Управления',6]]
	TYPEGROUPS = [['Бакалавриат',0], ['Магистратура',1], ['Специалитет',2]]
  CHAIRS = [['Кафедра 1',0],['Кафедра 2',1]]

  validates :receiptdate, :expirationdate, presence: true
	validates :person_id, uniqueness: true
  # включаются в массив
  validate :check_interval
  validates :group, presence: true
	validates :course, presence: true, numericality: {only_integer: true, greater_than: 0}

  private

  def check_interval
    if self.receiptdate && self.expirationdate != nil
      errors.add(:receiptdate, 'не может быть позднее даты окончания') if self.receiptdate > self.expirationdate
    end
    true
  end
end
