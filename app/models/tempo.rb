class Tempo < ApplicationRecord
  has_many :dances

  validates :name, presence: true, uniqueness: true
end
