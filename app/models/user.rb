class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 3}, confirmation: true,
            if: Proc.new { |u| u.new_record? or !u.password.blank? }

  def is_admin?()
    true
  end

  scope :ordering, -> { order(:email) }
end
