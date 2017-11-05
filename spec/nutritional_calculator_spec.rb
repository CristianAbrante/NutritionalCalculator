require "spec_helper"

RSpec.describe NutritionalCalculator::Food do

  before :each do

    nutritional_hash = NutritionalCalculator::read_nutritional_file "lib/files/nutritional_file.txt"

    @food_vector = []
    pos = 0

    nutritional_hash.each do |food_name, nutrients|
      @food_vector.push(NutritionalCalculator::Food.new(food_name, nutrients[0], nutrients[1], nutrients[2]))
    end

  end

  describe "Almacenamiento del nombre" do
    it "nombre del alimento" do
      expect(@food_vector[0].name).to eq("Huevo frito")
      expect(@food_vector[1].name).to eq("Leche vaca")
      expect(@food_vector[2].name).to eq("Yogurt")
      expect(@food_vector[3].name).to eq("Cerdo")
      expect(@food_vector[4].name).to eq("Ternera")
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
      expect(@food_vector[0].proteins).to eq(14.1)
      expect(@food_vector[1].proteins).to eq(3.3)
      expect(@food_vector[2].proteins).to eq(0.0)
      expect(@food_vector[3].proteins).to eq(21.5)
      expect(@food_vector[4].proteins).to eq(21.1)
    end

    it "Valor de los glúcidos" do
      expect(@food_vector[0].carbohydrates).to eq(0.0)
      expect(@food_vector[1].carbohydrates).to eq(4.8)
      expect(@food_vector[2].carbohydrates).to eq(4.9)
      expect(@food_vector[3].carbohydrates).to eq(0.0)
      expect(@food_vector[4].carbohydrates).to eq(0.0)
    end

    it "Valor de los lípidos" do
      expect(@food_vector[0].lipids).to eq(19.5)
      expect(@food_vector[1].lipids).to eq(3.2)
      expect(@food_vector[2].lipids).to eq(3.8)
      expect(@food_vector[3].lipids).to eq(6.3)
      expect(@food_vector[4].lipids).to eq(3.1)
    end

  end

  describe "Valor del alimento formateado" do
    it "valor formateado" do
      expect("#{@food_vector[0]}").to eq("Huevo frito -> proteínas(14.1) glúcidos(0.0) lípidos(19.5)")
    end
  end

  describe "Valor nutricional del alimento" do
    it "valor nutricional" do
      expect(@food_vector[0].get_nutritional_value).to eq(231.9)
      expect(@food_vector[1].get_nutritional_value).to eq(61.2)
      expect(@food_vector[2].get_nutritional_value).to eq(53.8)
      expect(@food_vector[3].get_nutritional_value).to eq(142.7)
      expect(@food_vector[4].get_nutritional_value).to eq(112.30000000000001)
    end
  end

end

RSpec.describe NutritionalCalculator::LinkedList do
  
end
