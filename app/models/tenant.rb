class Tenant < ActiveRecord::Base
  has_attached_file :avatar, styles: {large: "500x500>", medium: "250x250>", thumb: "50x50>"}
  validates_attachment :avatar, content_type: {content_type: /\Aimage\/.*\z/}
  belongs_to :resident, polymorphic: true
  belongs_to :student, -> { where(tenants: {resident_type: 'Student'}) }, foreign_key: 'resident_id'
  belongs_to :relative, -> { where(tenants: {resident_type: 'Relative'}) }, foreign_key: 'resident_id'
  belongs_to :workman, -> { where(tenants: {resident_type: 'Workmen'}) }, foreign_key: 'resident_id'
  belongs_to :guest, -> { where(tenants: {resident_type: 'Guest'}) }, foreign_key: 'resident_id'

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

  # validates :phone, presence: true
  validates :note, length: {minimum: 6}, allow_blank: true
  validates :arrivaldate, :checkoutdate, presence: true
  validate :check_interval

  def self.search(search)

  end
  def check_date_move
    if self.checkoutdate<Date.today
      "Срок договора истек"
    elsif self.checkoutdate-Date.today<=7
      "Срок договора истекает через #{self.human_day((self.checkoutdate-Date.today).to_i)}"
    end
  end
  def human_day(d = nil)
    "#{d} #{RuPropisju.choose_plural(d, 'день', 'дня', 'дней')}"
  end
  def check_resident_type
    if self.resident_type == 'Student'
      "студент"
    elsif self.resident_type == "Workman"
      "сотрудник"
    elsif self.resident_type == "Guest"
      "гость"
    elsif self.resident_type == "Relative"
      "родственник"
    end
  end
  def self.niceselect(tenant)
    "#{tenant.resident.person.lastname} #{tenant.resident.person.firstname} #{tenant.resident.person.secondname}"
  end
  private

  def check_interval
    if self.arrivaldate && self.checkoutdate != nil
      errors.add(:arrivaldate, 'не может быть позднее даты выселения') if self.arrivaldate > self.checkoutdate
    end
    true
  end
end
