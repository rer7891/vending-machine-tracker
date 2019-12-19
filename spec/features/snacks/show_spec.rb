require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit snack_path(burger)" do
    before :each do
      @owner = Owner.create(name: "Sam's Snacks")
      @dons  = @owner.machines.create(location: "Don's Mixed Drinks")

      @burger = @dons.snacks.create(name: "White Castle Burger", price: 350)
      @pop_rocks = @dons.snacks.create(name: "Pop Rocks", price: 150)
      @cheetos = @dons.snacks.create(name: "Flaming Hot Cheetos", price: 250)

      @owner_2 = Owner.create(name: "Bob's Snacks")
      @bobs  = @owner_2.machines.create(location: "Bob's Snack Shop")

      @burger.machines <<  @bobs
      @fritos = @bobs.snacks.create(name: "Fritos", price: 150)
      @lollypops = @bobs.snacks.create(name: "Lollypop", price: 350)
    end
    it "can see the locations of the machines it is in" do
        visit machine_snack_path(@burger)

        expect(page).to have_content(@bobs.name)
        expect(page).to have_content(@dons.name)
    end

    xit "and can see the ave price and quantity of snacks for that machine" do
    end

    xit "can see all items in that machine" do
    end
  end
end
