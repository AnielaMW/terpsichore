class CommentType < ApplicationRecord
  has_many :dance_comments

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
