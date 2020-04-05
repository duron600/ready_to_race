class Track < ApplicationRecord
  has_many :racing_sessions, :dependent => :destroy
  has_many :laps, :through => :racing_sessions
end
