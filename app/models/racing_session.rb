class RacingSession < ApplicationRecord
  has_many :session_participations, :dependent => :destroy

  scope :current, lambda{ where :end_at => nil }

  def end
    touch :end_at
  end
end
