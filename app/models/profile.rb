class Profile < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true

  def ima
    dancer || caller || musician || band || choreographer || composer
  end

  def summary
    ima || about
  end
end
