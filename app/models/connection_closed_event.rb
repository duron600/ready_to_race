class ConnectionClosedEvent < AcServerEvent
  include ConnectionEvent

  private

  def save_parsed_content
    if alive_connection = ClientConnection.alive.find_by({:driver_id => driver.id, :car_id => car.id})
      alive_connection.close
    else
      raise EventRecordingError.new("No connection alive while trying to close connection.")
    end
  end
end
