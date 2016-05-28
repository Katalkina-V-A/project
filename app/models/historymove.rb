class Historymove < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :room

  has_many :requests

  validates :room_id, :datein, presence: true

  validates :tenant_id, uniqueness: {scope: [:room_id, :dateout]}
  validates :tenant_id, uniqueness: {scope: [:room_id, :datein]}
end