class ClientConnection < ApplicationRecord

  belongs_to :driver
  belongs_to :car

  has_many :session_participations, :dependent => :destroy
end
