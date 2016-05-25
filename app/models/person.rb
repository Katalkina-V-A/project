class Person < ActiveRecord::Base
  has_one :student, dependent: :destroy, inverse_of: :person
  has_one :workman, dependent: :destroy, inverse_of: :person
  has_one :relative, dependent: :destroy, inverse_of: :person
  has_one :guest, dependent: :destroy, inverse_of: :person
  has_one :visitor, dependent: :destroy, inverse_of: :person
  has_one :employee, dependent: :destroy, inverse_of: :person

  SEXES = [['Мужской',0],['Женский',1]]
  scope :ordering, ->{order(:lastname)}
  validate :check_birthday
  validates :lastname, :firstname, :birthday, :sex, presence: true
  validates :lastname, uniqueness: {scope: [:firstname, :secondname, :birthday]}
  private
  def check_birthday
    errors.add(:birthday, :invalid) if birthday && birthday > Date.today
    true
  end
end
