class Building < ActiveRecord::Base

  has_many :rooms
  has_many :buildingemployees, dependent: :destroy
  has_many :employees, through: :buildingemployees
  has_many :linens
  has_many :furnitures

  scope :ordering, -> { order(:name) }
  validates :address, presence: true, uniqueness: true
  validates :name, presence: true
  validates :numb, :quantityroom, :floor, numericality: {only_integer: true, greater_or_equal_than: 0}, allow_blank: true

  TYPEBUILDS = [['Квартирный',0], ['Коридорный',1], ['Блочный',2]]

  STATES = [['Жилой',0], ['Ремонт',1], ['Строительство',2]]

end
