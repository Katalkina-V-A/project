class Tenant < ActiveRecord::Base
  belongs_to :resident, polymorphic: true

  has_many :visitortenants, dependent: :destroy
  has_many :visitors, through: :visitortenants

  has_many :linenattenants
  has_many :linens, through: :linenattenants

  has_many :historymoves, dependent: :destroy
  has_many :rooms, through: :historymoves

  TENANTSTYPE = [['Студент',0], ['Сотрудник',1], ['Гость',2], ['Родственник',3]]
end
