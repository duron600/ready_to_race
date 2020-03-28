class Racer < ApplicationRecord
  validates :name, :uniqueness => true, :presence => true
end
