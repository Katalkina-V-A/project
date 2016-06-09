class Furnitureinroom < ActiveRecord::Base
  belongs_to :furniture, -> { ordering }
  belongs_to :room, -> { ordering }

  scope :ordering, -> { joins(:furniture).order("name") }

  validates :quantity, presence: true, numericality: {only_integer: true, greater_or_equal_than: 0}
  validates :furniture_id, presence: true, uniqueness: {scope: [:room_id]}

  def human_quantity(d = nil)
    "#{d} #{RuPropisju.choose_plural(d, 'штука', 'штуки', 'штук')}"
  end
end
