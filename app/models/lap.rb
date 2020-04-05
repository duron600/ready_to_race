class Lap < ApplicationRecord
  belongs_to :session_participation

  has_many :leaderboard_items, :dependent => :destroy

  before_create :populate_attributes

  private

  def populate_attributes
    self.driver_name =  session_participation.driver_name
    self.car_model =  session_participation.car_model
  end
end
