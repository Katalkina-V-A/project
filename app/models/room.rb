class Room < ActiveRecord::Base
  belongs_to :building, -> { ordering }

  has_many :furnitureinrooms
  accepts_nested_attributes_for :furnitureinrooms, allow_destroy: true

  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures

  has_many :historymoves
  has_many :tenants, through: :historymoves

  scope :ordering, -> { order(:numb) }

  validates :numb, numericality: {only_integer: true, greater_or_equal_than: 0}
  validates :building_id, :numb, presence: true
  validates :floor, :section, :place, numericality: {only_integer: true, greater_or_equal_than: 0}, allow_blank: true
  validates :building_id, uniqueness: {scope: :numb}
  validates :note, length: {minimum: 6}, allow_blank: true

  STATES = [['Жилая',0], ['Ремонт',1], ['Подсобное помещение',2]]
  ACCESSORIES = [['Мужская',0], ['Женская',1], ['Семейная',2]]
  ACCESSORYFACULTIES = [['Автоматики',0], ['Безопасности',1], ['Вечерний',2], ['Кибернетики',3], ['Теоретической физики',4], ['Экспериментальной физики',5], ['Управления',6]]
  TYPEROOMS = [['Однокомнатная',0], ['Двухкомнатная',1], ['Трехкомнатная',2], ['Блок',3], ['Комната',4]]
  attr_reader :files

  def files=(val)
    val.each_with_index do |file, i|
      self.pictures.build(image: file, position: pictures.maximum(:position).to_i + i + 1)
    end
  end

  def human_place(d = nil)
    "#{d} #{RuPropisju.choose_plural(d, 'человекa', 'человек')}"
  end
end
