class EndSessionEvent < AcServerEvent
  def saved_file_name
    AcProtocol.utf_string(content, 1)
  end

  private

  def save_parsed_content
    if current_racing_session = RacingSession.current.last
      current_racing_session.end
    else
      raise EventRecordingError.new("No session in progress while trying to end session.")
    end
  end
end
