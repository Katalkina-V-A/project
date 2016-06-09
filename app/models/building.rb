class Building < ActiveRecord::Base
  before_validation :prepare_typebuild
  has_many :rooms, dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures
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

  attr_reader :files

  def files=(val)
    val.each_with_index do |file, i|
      self.pictures.build(image: file, position: pictures.maximum(:position).to_i + i + 1)
    end
  end

  def prepare_typebuild
    if self.typebuild.kind_of?(Array)
      self.typebuild = self.typebuild.select{|t| !t.blank?}.map(&:to_i)
    end
  end


end
