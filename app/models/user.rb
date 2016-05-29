class User < ActiveRecord::Base
  authenticates_with_sorcery!

  belongs_to :client, polymorphic: true

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 3}, confirmation: true,
            if: Proc.new { |u| u.new_record? or !u.password.blank? }, allow_blank: true

  ROLES = %w{Проживающий Комендант Кастелянша Охранник Администратор}
  validates :role, presence: true, inclusion: {in: 0...ROLES.size}

  def is_admin?()
    role == 4
  end
  def is_commandant?()
    role == 1
  end
  def is_matron?()
    role == 2
  end
  def is_tenant?()
    role == 0
  end
  def is_security?()
    role == 3
  end

  def role_name
    role && ROLES[role]
  end
  
  scope :ordering, -> { order(:email) }

  def self.edit_level_one?(u)
    u.try(:is_admin?) || u.try(:is_tenant?) || u.try(:is_commandant?)
  end

  def self.edit_level_two?(u)
    u.try(:is_commandant?) || u.try(:is_admin?)
  end

  def self.edit_level_three?(u)
    u.try(:is_admin?) || u.try(:is_tenant?) || u.try(:is_matron?)
  end
  def self.edit_level_four?(u)
    u.try(:is_admin?) || u.try(:is_matron?)
  end
  def self.edit_level_five?(u)
    !u.try(:is_tenant?)
  end
  def self.edit_level_six?(u)
    !u.try(:is_matron?)
  end
  def self.edit_level_seven?(u)
    u.try(:is_security?) || u.try(:is_admin?)
  end
  def self.edit_level_eight?(u)
    u.try(:is_matron?) || u.try(:is_admin?) || u.try(:is_commandant?)
  end
end
