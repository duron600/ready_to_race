class LapCompletedEvent < AcServerEvent
  def car_id
    AcProtocol.int_8bit(content, 1)
  end

  def lap_time
    AcProtocol.int_32bit(content, 2)
  end

  def cuts
    AcProtocol.int_8bit(content, 6)
  end

  def cars_count
    AcProtocol.int_8bit(content, 7)
  end

  def leader_board
    return @leader_board if defined? @leader_board 
    @leader_board = []
    cars_count.times do |i|
      @leader_board << {
        :car_id => AcProtocol.int_8bit(content, i * 8 + 8),
        :rtime => AcProtocol.int_32bit(content, i * 8 + 9),
        :rlaps => AcProtocol.int_8bit(content, i * 8 + 13)
      }
    end
    @leader_board
  end
end
