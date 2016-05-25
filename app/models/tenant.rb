class Tenant < ActiveRecord::Base
  belongs_to :resident, polymorphic: true
  accepts_nested_attributes_for :resident
  has_many :visitortenants, dependent: :destroy
  has_many :visitors, through: :visitortenants

  has_many :linenattenants
  has_many :linens, through: :linenattenants

  has_many :historymoves, dependent: :destroy
  has_many :rooms, through: :historymoves

  TENANTS_TYPE = [['Студент', 0], ['Сотрудник', 1], ['Гость', 2], ['Родственник', 3]]
  scope :ordering, -> { includes(:person).order("people.lastname") }
  def get_person
    if !self.student_id.nil?
      self.student.person
    elsif !self.workman_id.nil?
      self.workman.person
    elsif !self.relative_id.nil?
      self.relative.person
    elsif !self.guest_id.nil?
      self.guest.person
    end
  end
end
