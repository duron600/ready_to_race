module ReadyToRace
  class ParseLog
    def initialize(line)
      @line = line
    end

    def run
    end
  end
end
desc 'parsing assetto corsa logs, write data into database'
task :parse_log => :environment do
  IO.popen('journalctl -fu acserver') do |log|
    log.each do |line|
      
    end
  end
end
