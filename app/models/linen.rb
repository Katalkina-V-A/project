class Linen < ActiveRecord::Base
  has_many :linenattenants
  has_many :tenants, through: :linenattenants
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures

  attr_reader :files

  def files=(val)
    val.each_with_index do |file, i|
      self.pictures.build(image: file, position: pictures.maximum(:position).to_i + i + 1)
    end
  end
  belongs_to :building, -> { ordering }

  scope :ordering, -> { order(:name) }

  validates :name, presence: true, uniqueness: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_or_equal_than: 0}
  validates :note, length: {minimum: 6}, allow_blank: true
end
