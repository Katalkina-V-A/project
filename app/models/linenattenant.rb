class Linenattenant < ActiveRecord::Base
  belongs_to :linen, -> { ordering }
  belongs_to :tenant, -> { ordering }

  validates :quantity, presence: true, numericality: {only_integer: true, greater_or_equal_than: 0}
  validates :linen_id, presence: true, uniqueness: {scope: [:tenant_id]}

  def human_quantity(d = nil)
    "#{d} #{RuPropisju.choose_plural(d, 'штука', 'штуки', 'штук')}"
  end
end
