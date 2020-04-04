class NewConnectionEvent < AcServerEvent

  include ConnectionEvent

  private

  def save_parsed_content
    ClientConnection.create({
      :driver => driver,
      :car => car,
      :car_index => car_index,
      :skin => car_skin
    })
  end

end
