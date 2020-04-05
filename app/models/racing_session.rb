class RacingSession < ApplicationRecord
  belongs_to :track

  has_many :session_participations, :dependent => :destroy
  has_many :laps, :through => :session_participations

  scope :current, lambda{ where :end_at => nil }

  delegate :name, :to => :track, :prefix => true

  def end
    touch :end_at
  end
end
