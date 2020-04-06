class ClientLoadedEvent < AcServerEvent
  def car_id
    AcProtocol.int_8bit(content, 1)
  end

  private

  def save_parsed_content
    ClientConnection.last_with_car_id(car_id).reconnect
  end
end
