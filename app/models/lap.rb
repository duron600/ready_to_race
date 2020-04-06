class Lap < ApplicationRecord

  belongs_to :session_participation
  belongs_to :driver
  belongs_to :car
  belongs_to :track

  has_many :leaderboard_items, :dependent => :destroy

  before_create :populate_attributes

  scope :counting, lambda { where :cuts => 0 }
  scope :fastest, lambda {joins('JOIN (SELECT MIN(time) AS minimum_time, driver_id FROM laps where cuts = 0 GROUP BY driver_id) AS fastest_lap ON laps.driver_id = fastest_lap.driver_id AND laps.time = fastest_lap.minimum_time')}

  delegate :name, :to => :driver, :prefix => true
  delegate :model, :to => :car, :prefix => true

  def <=>(another_lap)
    raise 'laps in different track cannot be compared' if track_id != another_lap.track_id
    time <=> another_lap.time
  end

  private

  def populate_attributes
    self.driver = session_participation.driver
    self.car = session_participation.car
    self.track = session_participation.track
  end
end
