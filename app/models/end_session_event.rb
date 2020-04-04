class EndSessionEvent < AcServerEvent
  def saved_file_name
    AcProtocol.utf_string(content, 1)
  end
end
