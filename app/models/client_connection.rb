class ClientConnection < ApplicationRecord

  belongs_to :driver
  belongs_to :car

  has_many :session_participations, :dependent => :destroy

  scope :alive, lambda { where :closed_at => nil }

  def close
    touch :closed_at
  end
end
