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

  describe "# almacenamiento de las constantes nutricionales" do

    it "Constante del valor nutricional de las proteínas" do
      expect(NutritionalCalculator::Food::PROTEINS_VALUE).to eq(4.0)
    end

    it "Constante del valor nutricional de los glúcidos" do
      expect(NutritionalCalculator::Food::CARBOHYDRATE_VALUE).to eq(4.0)
    end

    it "Constante del valor nutricional de las proteínas" do
      expect(NutritionalCalculator::Food::LIPIDS_VALUE).to eq(9.0)
    end

  end

end
