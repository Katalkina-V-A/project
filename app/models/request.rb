class Request < ActiveRecord::Base
  belongs_to :employee
  belongs_to :historymove

  STATUSES = [['Ожидается рассмотрение',0],['Выполнено',1],['Отклонено',2]]
  scope :ordering, -> { includes(employee: [:person]) }
  validates :employee_id, :historymove_id, :dateapp, presence: true
  validates :historymove_id, uniqueness: {scope: [:employee_id, :dateapp]}
end
