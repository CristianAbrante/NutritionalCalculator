require "spec_helper"

RSpec.describe NutritionalCalculator::Food do

  before :each do
    @test_food = NutritionalCalculator::Food.new("Huevo frito", 14.1, 0.0, 19.5)
  end

  describe "Almacenamiento del nombre" do
    it "nombre del alimento" do
      expect(@test_food.name).to eq("Huevo frito")
    end
  end

  describe "Almacenamiento de las constantes nutricionales" do

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

  describe "Almacenamiento y acceso del valor de los macronutrientes." do

    it "Valor de las proteínas" do
      expect(@test_food.proteins).to eq(14.1)
    end

    it "Valor de los glúcidos" do
      expect(@test_food.carbohydrates).to eq(0.0)
    end

    it "Valor de los lípidos" do
      expect(@test_food.lipids).to eq(19.5)
    end

  end

  describe "Valor del alimento formateado" do
    it "valor formateado" do
      expect("#{@test_food}").to eq("Huevo frito -> proteínas(14.1) glúcidos(0.0) lípidos(19.5)")
    end
  end

  describe "Valor nutricional del alimento" do
    it "valor nutricional" do
      expect(@test_food.get_nutritional_value).to eq(231.9)
    end
  end

end
