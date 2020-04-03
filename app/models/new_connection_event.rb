class NewConnectionEvent < AcServerEvent

  def driver
    @driver = Driver.find_or_create_by(:guid => driver_guid) do |driver|
      driver.name = driver_name
    end
  end

  def car
    @car ||= Car.find_or_create_by(:model => car_model)
  end

  def driver_guid
    return @driver_guid if defined? @driver_guid
    length = content.unpack("@#{(driver_name.length * 4 + 2)}C").last
    @driver_guid = content.unpack("@#{driver_name.length * 4 + 3}" << 'A4' * length).join
  end

  def driver_name
    return @driver_name if defined? @driver_name
    length = content.unpack('@1C').last
    @driver_name = content.unpack('@2' << 'A4' * length).join
  end

  def car_index
    @car_index ||= content.unpack("@#{3 + driver_guid.length * 4 + driver_name.length * 4}C").last
  end

  def car_model
    return @car_model if defined? @car_model
    length = content.unpack("@#{4 + driver_guid.length * 4 + driver_name.length * 4}C").last
    @car_model = content.unpack("@#{5 + driver_guid.length * 4 + driver_name.length * 4}A#{length}").last
  end

  def car_skin
    return @car_skin if defined? @car_skin
    length = content.unpack("@#{5 + driver_guid.length * 4 + driver_name.length * 4 + car_model.length}C").last
    @car_skin = content.unpack("@#{6 + driver_guid.length * 4 + driver_name.length * 4 + car_model.length}A#{length}").last
  end

  private

  def parse_content
    ClientConnection.create({
      :driver => driver,
      :car => car,
      :car_index => car_index,
      :skin => car_skin
    })
  end

end
