class SessionParticipation < ApplicationRecord
  belongs_to :client_connection
  belongs_to :racing_session

  delegate :driver_name, :car_model, :to => :client_connection
end
