class AcProtocol
  class << self
    def int_8bit(bin, offset=0)
      bin.unpack("@#{offset}C").last
    end

    def int_16bit(bin, offset=0)
      bin.unpack("@#{offset}S").last
    end

    def int_32bit(bin, offset=0)
      bin.unpack("@#{offset}L").last
    end

    def signed_int_32bit(bin, offset=0)
      bin.unpack("@#{offset}l").last
    end

    def float(bin, offset=0)
      bin.unpack("@#{offset}F").last
    end

    def string(bin, offset=0)
      bin.unpack("@#{offset + 1}A#{int_8bit(bin, offset)}").join
    end

    def utf_string(bin, offset=0)
      bin.unpack("@#{offset + 1}" << 'A4' * int_8bit(bin, offset)).join
    end
  end
end
