class Tenant < ActiveRecord::Base
  belongs_to :resident, polymorphic: true

  has_one :user, as: :client
  accepts_nested_attributes_for :user

  has_many :visitortenants, dependent: :destroy
  has_many :visitors, through: :visitortenants

  has_many :linenattenants
  has_many :linens, through: :linenattenants
  accepts_nested_attributes_for :linenattenants, allow_destroy: true

  has_many :historymoves
  has_many :rooms, through: :historymoves
  accepts_nested_attributes_for :historymoves, allow_destroy: true

  TENANTSTYPE = [['Студент',0], ['Сотрудник',1], ['Гость',2], ['Родственник',3]]

  scope :ordering, -> { order(created_at: :desc) }

  validates :phone, presence: true
  validates :note, length: {minimum: 6}, allow_blank: true
  validates :arrivaldate, :checkoutdate, presence: true
  validate :check_interval

def self.search(search)

end

  private

  def check_interval
    if self.arrivaldate && self.checkoutdate != nil
      errors.add(:arrivaldate, 'не может быть позднее даты выселения') if self.arrivaldate > self.checkoutdate
    end
    true
  end
end
