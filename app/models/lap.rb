class Lap < ApplicationRecord
  belongs_to :session_participation

  has_many :leaderboard_items, :dependent => :destroy
end
