class NewConnectionEvent < AcServerEvent

  include ConnectionEvent

  private

  def save_parsed_content
    ClientConnection.alive.where(:driver_id => driver.id, :car_id => car.id).each(&:close)
    ClientConnection.create({
      :driver => driver,
      :car => car,
      :car_index => car_index,
      :skin => car_skin
    })
  end

end
