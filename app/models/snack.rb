class Snack < ApplicationRecord
  validates_presence_of :name, :price

  has_many :machines
  has_many :machines, through: :snack_machine

  def self.ave_price
    average(:price)/100.round(2)
  end
end
