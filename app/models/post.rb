class Post < ActiveRecord::Base
  has_one :document
  accepts_nested_attributes_for :document
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures

  belongs_to :user
  belongs_to :building

  attr_reader :files
  attr_reader :documents

  def files=(val)
    val.each_with_index do |file, i|
      self.pictures.build(image: file, position: pictures.maximum(:position).to_i + i + 1)
    end
  end
  def document=(val)
    self.build_document(doc: val, title: self.title)
  end
  scope :ordering, ->{order(updated_at: :desc)}
end
