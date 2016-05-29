class Request < ActiveRecord::Base
  belongs_to :employee, -> { ordering }
  belongs_to :historymove

  STATUSES = [['Ожидается рассмотрение',0],['Выполнено',1],['Отклонено',2]]
  scope :ordering, -> { order(:created_at) }

  validates :employee_id, :historymove_id, :content, presence: true
  validates :historymove_id, uniqueness: {scope: [:employee_id, :dateapp]}
end
