class RacingSession < ApplicationRecord
  has_many :session_participations, :dependent => :destroy
end
