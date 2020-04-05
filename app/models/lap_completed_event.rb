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

  def leaderboard
    return @leaderboard if defined? @leaderboard 
    @leaderboard = []
    cars_count.times do |i|
      @leaderboard << {
        :car_id => AcProtocol.int_8bit(content, i * 8 + 8),
        :rtime => AcProtocol.int_32bit(content, i * 8 + 9),
        :rlaps => AcProtocol.int_8bit(content, i * 8 + 13)
      }
    end
    @leaderboard
  end

  private

  def save_parsed_content
    connection = ClientConnection.alive.find_by(:car_index => car_id)
    session = RacingSession.current.last
    if !connection
      raise EventRecordingError.new("No client connection alive")
    elsif !session
      raise EventRecordingError.new("No racing session in progress")
    else
      current_session_participation = SessionParticipation.find_or_create_by({:client_connection_id => connection.id, :racing_session_id => session.id})
      lap = Lap.create({:session_participation => current_session_participation, :time => lap_time, :cars_count => cars_count, :cuts => cuts })
      session.update_attribute :total_laps, session.laps.count
      leaderboard.each do |item|
        if connection_for_item = ClientConnection.alive.find_by(:car_index => item[:car_id])
          session_participation = SessionParticipation.find_or_create_by({:client_connection_id => connection_for_item.id, :racing_session_id => session.id})
          lap.leaderboard_items.create({:session_participation_id => session_participation.id, :rtime => item[:rtime], :rlaps => item[:rlaps]})
        end
      end
    end
  end

end
