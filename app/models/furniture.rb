class Furniture < ActiveRecord::Base
  has_many :furnitureinrooms
  has_many :rooms, through: :furnitureinrooms

  belongs_to :building, -> {ordering}

  scope :ordering, -> { order(:name) }

  validates :name, presence: true, uniqueness: true
  validates :quantity, numericality: {only_integer: true, greater_or_equal_than: 0}
  validates :note, length: {minimum: 6}, allow_blank: true

end
