class Car < ApplicationRecord
  validates :model, :presence => true, :uniqueness => true

  before_save :ensure_name

  has_many :connections, :class_name => 'ClientConnection', :dependent => :destroy

  private

  def ensure_name
    self.name ||= model
  end
end
