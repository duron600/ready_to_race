#
# 时间周期的格式转换，支持天、时、分、秒、毫秒
#
class IntervalConverter
  class << self

    #
    # 微秒值转换成字符串
    # 3600000 => '1h'
    # 86401055 => '1d0h0m1s55ms'
    #
    def ms_to_s(value)
      milliseconds = value.abs
      if milliseconds.zero?
        '0ms'
      else
        seconds = milliseconds.fdiv(1000)
        conversions = [["d", 86400], ["h", 3600], ["m", 60], ["s", 1], ['ms', 0.001]]
        tmp = []
        conversions.inject([]) do |result, conversion|
          unit = conversion[0]
          base = conversion[1]
          remainder = seconds % base
          if remainder != seconds || !result.blank?
            quotient = seconds.fdiv(base).round
            tmp << [quotient, unit]
            result = tmp.dup if !quotient.zero?
            seconds = remainder
          end
          result
        end.flatten.join.prepend(value.negative? ? '-' : '')
      end
    end

    #
    # 字符串转换成微秒值
    # '1h' => 3600000
    # '1d0h0m1s55ms' => 86401055
    #
    def s_to_ms(string)
      /(?:(\d+)d)?(?:(\d+)h)?(?:(\d+)m)?(?:(\d+)s)?(?:(\d+)ms)?/ =~ string
      day, hour, minute, second, ms = $1, $2, $3, $4, $5
      day ||= 0
      hour ||= 0
      minute ||= 0
      second ||= 0
      ms ||= 0
      (day.to_i.days + hour.to_i.hours + minute.to_i.minutes + second.to_i.seconds).to_i * 1000 + ms.to_i
    end
  end
end
