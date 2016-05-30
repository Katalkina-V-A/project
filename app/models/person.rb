class Person < ActiveRecord::Base
  has_one :student, dependent: :destroy
  accepts_nested_attributes_for :student

  has_one :workman, dependent: :destroy
  accepts_nested_attributes_for :workman

  has_one :relative, dependent: :destroy
  accepts_nested_attributes_for :relative

  has_one :guest, dependent: :destroy
  accepts_nested_attributes_for :guest

  has_one :visitor, dependent: :destroy, inverse_of: :person
  has_one :employee, dependent: :destroy, inverse_of: :person

  SEXES = [['Мужской',0],['Женский',1]]

  scope :ordering, ->{order(:lastname)}

  validate :check_birthday
  validates :lastname, :firstname, :birthday, :sex, presence: true
  validates :lastname, uniqueness: {scope: [:firstname, :secondname, :birthday]}

  def get_person
    if !self.student.nil?
      self.student
    elsif !self.workman.nil?
      self.workman
    elsif !self.relative.nil?
      self.relative
    elsif !self.guest.nil?
      self.guest
    end
  end

  def person_class_label
    if !self.student.nil?
      :student
    elsif !self.workman.nil?
      :workman
    elsif !self.relative.nil?
      :relative
    elsif !self.guest.nil?
      :guest
    end
  end

  private
  def check_birthday
    errors.add(:birthday, :invalid) if birthday && birthday > Date.today
    true
  end


end
