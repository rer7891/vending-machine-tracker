require "rails_helper"

RSpec.describe Snack, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :price}
  end

  describe "relationships" do
    it {should belong_to :machine}
  end

  describe "methods" do
    it "should calculate average price of snacks" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")

      burger = dons.snacks.create(name: "White Castle Burger", price: 3)
      pop_rocks = dons.snacks.create(name: "Pop Rocks", price: 1)
      cheetos = dons.snacks.create(name: "Flaming Hot Cheetos", price: 2)

      expect(Snack.ave_price).to eq(2)
    end
  end
end
