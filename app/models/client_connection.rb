class ClientConnection < ApplicationRecord

  belongs_to :driver
  belongs_to :car

  has_many :session_participations, :dependent => :destroy

  scope :alive, lambda { where :closed_at => nil }

  delegate :name, :to => :driver, :prefix => true
  delegate :model, :to => :car, :prefix => true

  class << self
    def last_with_car_id(car_id)
      order(:created_at => 'ASC').where(:car_index => car_id).last
    end
  end

  def close
    touch :closed_at
  end

  def reconnect
    update :closed_at => nil
  end
end
