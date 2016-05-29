class Visitortenant < ActiveRecord::Base
  belongs_to :tenant, -> { ordering }
  belongs_to :visitor, -> { ordering }

  validates :tenant_id, :arrivaldate, :arrivaltime, presence: true
  validates :tenant_id, uniqueness: {scope: [:visitor_id, :arrivaldate]}
  validates :note, length: {minimum: 6}, allow_blank: true
  validate :check_interval

  private

  def check_interval
    # if self.leavetime =! nil
    #   errors.add(:arrivaltime, 'не может быть позднее времени выхода') if Time.zone(self.arrivaltime) > Time.zone(self.leavetime)
    # end
    true
  end
end
