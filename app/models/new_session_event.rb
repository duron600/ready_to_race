class NewSessionEvent < AcServerEvent
  def version
    AcProtocol.int_8bit(content, 1)
  end

  def session_index
    AcProtocol.int_8bit(content, 2)
  end

  def current_session_index
    AcProtocol.int_8bit(content, 3)
  end

  def session_count
    AcProtocol.int_8bit(content, 4)
  end

  def server_name
    AcProtocol.utf_string(content, 5)
  end

  def track_name
    @track_name ||= AcProtocol.string(content, 6 + server_name.size * 4)
  end

  def track_config
    @track_config ||= AcProtocol.string(content, 7 + server_name.size * 4 + track_name.size)
  end

  def session_name
    @session_name ||= AcProtocol.string(content, 8 + server_name.size * 4 + track_name.size + track_config.size)
  end

  def typ
    @typ ||= AcProtocol.int_8bit(content, 9 + server_name.size * 4 + track_name.size + track_config.size + session_name.size)
  end

  def session_time
    @session_time ||= AcProtocol.int_16bit(content, 10 + server_name.size * 4 + track_name.size + track_config.size + session_name.size)
  end

  def laps
    @laps ||= AcProtocol.int_16bit(content, 12 + server_name.size * 4 + track_name.size + track_config.size + session_name.size)
  end

  def wait_time
    @wait_time ||= AcProtocol.int_16bit(content, 14 + server_name.size * 4 + track_name.size + track_config.size + session_name.size)
  end

  def ambient_temperature
    @ambient_temperature ||= AcProtocol.int_8bit(content, 16 + server_name.size * 4 + track_name.size + track_config.size + session_name.size)
  end

  def road_temperature
    @road_temperature ||= AcProtocol.int_8bit(content, 17 + server_name.size * 4 + track_name.size + track_config.size + session_name.size)
  end

  def weather_graphics
    @weather_graphics ||= AcProtocol.string(content, 18 + server_name.size * 4 + track_name.size + track_config.size + session_name.size)
  end

  def elapsed_ms
    @elapsed_ms ||= AcProtocol.signed_int_32bit(content, 19 + server_name.size * 4 + track_name.size + track_config.size + session_name.size + weather_graphics.size)
  end
end
