class Lap < ApplicationRecord

  has_many :leaderboard_items, :dependent => :destroy
end
