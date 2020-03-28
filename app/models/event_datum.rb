class EventDatum < ApplicationRecord

  validates :content, :presence => true

  before_save :set_packet_id

  private

  def set_packet_id
    self.packet_id = content.unpack('C').last
  end
end
