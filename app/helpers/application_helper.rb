module ApplicationHelper
  def ms_to_str(ms)
    remainder = ms
    r = []
    [3600000, 60000, 1000].each do |base|
      quotient = remainder.fdiv(base).floor
      remainder = remainder % base
      r << quotient
    end
    r.join(':') << ".#{remainder}"
  end
end
