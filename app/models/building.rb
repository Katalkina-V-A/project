class Building < ActiveRecord::Base

  has_many :rooms, dependent: :destroy

  has_many :buildingemployees, dependent: :destroy
  has_many :employees, through: :buildingemployees


  has_many :linens, dependent: :destroy
  has_many :furnitures, dependent: :destroy

  scope :ordering, -> { order(:name) }

  validates :address, presence: true, uniqueness: true, length: {minimum: 6}
  validates :name, presence: true, uniqueness: true, length: {minimum: 6}
  # validates :index, presence: true, numericality: {only_integer: true, greater_or_equal_than: 100000, less_than: 1000000}
  validates :numb, :quantityroom, :floor, numericality: {only_integer: true, greater_or_equal_than: 0}, allow_blank: true
  validates :note, length: {minimum: 6}, allow_blank: true
  # validates :state, inclusion: { in: STATES }
  # validates :typebuild, inclusion: { in: TYPEBUILDS }

  TYPEBUILDS = [['Квартирный',0], ['Коридорный',1], ['Блочный',2]]

  STATES = [['Жилой',0], ['Ремонт',1], ['Строительство',2]]
end
