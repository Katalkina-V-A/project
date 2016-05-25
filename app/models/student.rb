class Student < ActiveRecord::Base
  belongs_to :person
  validates_presence_of :person
  accepts_nested_attributes_for :person
  has_one :tenant, as: :resident
  has_many :relatives, as: :kin

  FACULTIES = [['Автоматики',0], ['Безопасности',1], ['Вечерний',2], ['Кибернетики',3], ['Теоретической физики',4], ['Экспериментальной физики',5], ['Управления',6]]
	TYPEGROUPS = [['Бакалавр',0], ['Магистр',1], ['Аспирант',2]]
  CHAIRS = [['Кафедра 1',0],['Кафедра 2',1]]

  validates :faculty, :typegroup, :group, :course, :reseptdate,
    :expirationdate, presence: true
	validates :person_id, uniqueness: true
	validates :course, numericality: {only_integer: true, greater_than: 0}

end
