require "rails_helper"

RSpec.describe "As a visitor", type: :feature do
    before :each do
      @owner = Owner.create(name: "Sam's Snacks")
      @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
    end
  describe "when I visit vending_path(dons)" do
    it "can see a name of all snacks associated with that vendor and their price" do

      burger = @dons.snacks.create(name: "White Castle Burger", price: 3_50)
      pop_rocks = @dons.snacks.create(name: "Pop Rocks", price: 1_50)
      cheetos = @dons.snacks.create(name: "Flaming Hot Cheetos", price: 2_50)

      visit machine_path(@dons)

      within "#snacklist-#{burger.id}" do
        expect(page).to have_content(burger.name)
        expect(page).to have_content(burger.price)
      end

      within "#snacklist-#{pop_rocks.id}" do
        expect(page).to have_content(pop_rocks.name)
        expect(page).to have_content(pop_rocks.price)
      end

      within "#snacklist-#{cheetos.id}" do
        expect(page).to have_content(cheetos.name)
        expect(page).to have_content(cheetos.price)
      end
    end

    it "can see an average price for all of the snacks" do

      burger = @dons.snacks.create(name: "White Castle Burger", price: 350)
      pop_rocks = @dons.snacks.create(name: "Pop Rocks", price: 150)
      cheetos = @dons.snacks.create(name: "Flaming Hot Cheetos", price: 250)
      snacks = Snack.all

      visit machine_path(@dons)

      within "#aveprice" do
        expect(page).to have_content("Average Snack Price: #{snacks.ave_price}")
      end
    end
  end
end
