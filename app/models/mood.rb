class Mood < ApplicationRecord
  has_many :dance_moods
  has_many :dances, through: :dance_moods

  validates :name, presence: true, uniqueness: true
end
