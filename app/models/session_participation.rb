class SessionParticipation < ApplicationRecord
  belongs_to :client_connection
  belongs_to :racing_session

  has_many :laps, :dependent => :destroy

  delegate :driver, :car, :driver_name, :car_model, :to => :client_connection
  delegate :track, :to => :racing_session

  delegate :name, :to => :driver, :prefix => true
  delegate :model, :to => :car, :prefix => true

end
