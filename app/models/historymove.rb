class Historymove < ActiveRecord::Base
  belongs_to :tenant, -> { ordering }
  belongs_to :room, -> { ordering }

  has_many :requests

  validates :room_id, :datein, presence: true

  validates :tenant_id, uniqueness: {scope: [:room_id, :dateout]}
  validates :tenant_id, uniqueness: {scope: [:room_id, :datein]}
  validates :note, length: {minimum: 6}, allow_blank: true
end
