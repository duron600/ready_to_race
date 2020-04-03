class AcServerEvent < ApplicationRecord

  validates :content, :presence => true

  before_create :set_type

  after_create :parse_content

  private

  def packet_id
    content.unpack('C').last
  end

  def set_type
    self.type = case packet_id
    when 50
      'NewSessionEvent'
    when 51
      'NewConnectionEvent'
    when 52
      'ConnectionClosedEvent'
    when 55
      'EndSessionEvent'
    when 56
      'VersionEvent'
    when 58
      'ClientLoadedEvent'
    when 59
      'SessionInfoEvent'
    when 73
      'LapCompletedEvent'
    when 130
      'CollisionEvent'
    else
      'UnknownAcServerEvent'
    end
  end

  def parse_content
    warn "Unimplement #{self.class.name}#parse_content"
  end

end
