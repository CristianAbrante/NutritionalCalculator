require "spec_helper"

RSpec.describe NutritionalCalculator::Food do

  before :each do
    @test_food = NutritionalCalculator::Food.new("Huevo frito")
  end

  describe "# almacenamiento del nombre" do
    it "nombre del alimento" do
      expect(@test_food.name).to eq("Huevo frito")
    end
  end

end
