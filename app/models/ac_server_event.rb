class AcServerEvent < ApplicationRecord

  validates :content, :presence => true

  after_create :save_parsed_content

  class << self
    def receive(content)
      klass = case AcProtocol.int_8bit(content)
      when 50
        NewSessionEvent
      when 51
        NewConnectionEvent
      when 52
        ConnectionClosedEvent
      when 55
        EndSessionEvent
      when 56
        VersionEvent
      when 58
        ClientLoadedEvent
      when 59
        SessionInfoEvent
      when 73
        LapCompletedEvent
      when 130
        CollisionEvent
      else
        UnknownAcServerEvent
      end
      klass.create(:content => content)
    end
  end

  private

  def save_parsed_content
    warn "Unimplement #{self.class.name}#save_parsed_content"
  end

end
