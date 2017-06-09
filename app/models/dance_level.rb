class DanceLevel < ApplicationRecord
  has_many :dances

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
