class ConnectionClosedEvent < AcServerEvent
  include ConnectionEvent

  private

  def save_parsed_content
    ClientConnection.alive.find_by({
      :driver_id => driver.id,
      :car_id => car.id
    }).close
  end
end
