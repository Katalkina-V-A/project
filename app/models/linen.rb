class Linen < ActiveRecord::Base
  has_many :linenattenants
  has_many :tenants, through: :linenattenants
  belongs_to :building, -> { ordering }
  scope :ordering, -> { order(:name) }
  validates :name, presence: true, uniqueness: true
  validates :quantity, numericality: {only_integer: true, greater_or_equal_than: 0}
end
