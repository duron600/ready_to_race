class Lap < ApplicationRecord

  belongs_to :session_participation
  belongs_to :driver
  belongs_to :car
  belongs_to :track

  has_many :leaderboard_items, :dependent => :destroy

  before_create :populate_attributes

  scope :counting, lambda { where :cuts => 0 }
  scope :fastest, lambda {counting.select('laps.*').joins('LEFT JOIN laps AS t2 ON laps.driver_id = t2.driver_id AND laps.time > t2.time').where('t2.driver_id is null')}

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
