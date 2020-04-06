class Driver < ApplicationRecord
  validates :guid, :uniqueness => true, :presence => true

  has_many :connections, :class_name => 'ClientConnection', :dependent => :destroy
  has_many :laps
end
