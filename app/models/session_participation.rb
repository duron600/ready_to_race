class SessionParticipation < ApplicationRecord
  belongs_to :client_connection
  belongs_to :racing_session
end
