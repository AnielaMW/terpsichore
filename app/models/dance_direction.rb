class DanceDirection < ApplicationRecord
  belongs_to :dance

  validates :sequence, presence: true
  validates :movement, presence: true
  validates :dance_id, presence: true
end
