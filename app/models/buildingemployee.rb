class Buildingemployee < ActiveRecord::Base
  belongs_to :employee, -> { ordering }
  belongs_to :building, -> { ordering }

  validates :building_id, :post, presence: true
  validates :building_id, uniqueness: {scope: [:employee_id, :post]}
  validate :check_interval
  validates :note, length: {minimum: 6}, allow_blank: true
  def self.search(search)
     where("upper(lastname) like upper(:q) or upper(firstname) like upper(:q)", q: "%#{search}%")
  end

  def self.search_char(search)
    where("lastname like (:q)", q: "#{search}%")
  end
  private

  def check_interval
    if self.startwork != nil && self.endwork != nil
      errors.add(:startwork, 'не может быть больше времени окончания работы') if self.startwork > self.endwork
    end
    true
  end
end
