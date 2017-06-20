class Profile < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true

  def ima
    self.dancer || self.caller || self.musician || self.band || self.choreographer || self.composer
  end

  def summary
    ima || self.about
  end
end
