module ConnectionEvent
  def driver
    @driver = Driver.find_or_create_by(:guid => driver_guid) do |driver|
      driver.name = driver_name
    end
  end

  def car
    @car ||= Car.find_or_create_by(:model => car_model)
  end

  def driver_name
    @driver_name ||= AcProtocol.utf_string(content, 1)
  end

  def driver_guid
    @driver_guid ||= AcProtocol.utf_string(content, 2 + driver_name.size * 4)
  end

  def car_index
    @car_index ||= AcProtocol.int_8bit(content, 3 + driver_guid.size * 4 + driver_name.size * 4)
  end

  def car_model
    @car_model ||= AcProtocol.string(content, 4 + driver_guid.size * 4 + driver_name.size * 4)
  end

  def car_skin
    @car_skin ||= AcProtocol.string(content, 5 + driver_guid.size * 4 + driver_name.size * 4 + car_model.size)
  end
end
