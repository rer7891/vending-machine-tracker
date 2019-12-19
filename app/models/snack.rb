class Snack < ApplicationRecord
  validates_presence_of :name, :price

  has_many :snack_machines
  has_many :machines, through: :snack_machines

  def self.ave_price
    average(:price)/100.round(2)
  end
end
