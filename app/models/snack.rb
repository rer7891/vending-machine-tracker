class Snack < ApplicationRecord
  validates_presence_of :name, :price

  belongs_to :machine

  def self.ave_price
    average(:price)/100.round(2)
  end
end
