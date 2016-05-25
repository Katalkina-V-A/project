class Furnitureinroom < ActiveRecord::Base
  belongs_to :furniture, -> { ordering }
  belongs_to :room, -> { ordering }

  validates :quantity, numericality: {only_integer: true, greater_or_equal_than: 0}
  validates :furniture_id, uniqueness: {scope: [:room_id]}
end
