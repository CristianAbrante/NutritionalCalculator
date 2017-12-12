require "spec_helper"

RSpec.describe NutritionalCalculator::Food do

  before :each do
    @food_vector = NutritionalCalculator::get_food_vector "lib/files/nutritional_file.txt"
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

  context "cálculo del índice glucémico del individuo" do

    before :each do

      @glucose = NutritionalCalculator::Food.new("glucosa", 0.0, 10.0, 0.0, [[4.9, 5.3, 5.9, 6.7, 7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1], [6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4, 10.8, 10.5, 9.1, 8.9, 8.3, 7.7, 7.6, 7.5]])

      @apple  = NutritionalCalculator::Food.new("Compota de manzana", 0.0, 0.0, 0.0, [[6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9], [4.6, 4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9]], @glucose)
      @yogurt = NutritionalCalculator::Food.new("yogurt", 0.0, 4.9, 3.8, [[6.1, 6.6, 6.3, 6.3, 6.1, 6.9, 6.8, 6.5, 6.4, 6.9, 6.8, 6.5, 6.3, 6.2, 6.7, 6.2, 5.9, 5.8, 5.8, 5.8, 5.8, 5.8, 5.9, 6.2, 6.4], [4.9, 4.9, 5.2, 5.8, 6.5, 7.0, 7.2, 7.3, 7.3, 6.6, 6.2, 6.1, 6.0, 6.1, 5.9, 5.9, 5.9, 5.9, 5.8, 5.8, 5.5, 5.5, 5.6, 5.9, 5.9]], @glucose)
      @chocolate = NutritionalCalculator::Food.new("chocolate", 5.3, 47.0, 30.0, [[6.5, 6.5, 6.7, 6.5, 6.5, 6.8, 6.7, 6.2, 6.5, 7.2, 6.9, 7.0, 6.3, 6.2, 6.1, 5.9, 5.8, 6.1, 6.7, 6.7, 6.6, 6.7, 6.9, 7.2, 7.1], [4.6, 4.6, 4.7, 4.7, 4.8, 4.7, 4.8, 4.8, 4.6, 4.4, 4.7, 4.7, 4.8, 4.7, 5.2, 5.9, 5.9, 5.7, 5.4, 5.3, 5.1, 4.8, 4.8, 4.9, 5.9]], @glucose)

    end

    it "El alimento puede almacenar un conjunto de valores glucémicos" do
      expect(@apple.glucose_concentration).not_to be(nil)
      expect(@yogurt.glucose_concentration).not_to be(nil)
      expect(@chocolate.glucose_concentration).not_to be(nil)
    end

    it "El alimento puede calcular el AIBC para un individuo concreto" do
      expect((27.5 - @apple.aibc(0)) < 0.01).to be(true)
      expect((21.75 - @yogurt.aibc(0)) < 0.01).to be(true)
      expect((7.5 - @chocolate.aibc(0)) < 0.01).to be(true)
      expect((256.0 - @glucose.aibc(0)) < 0.01).to be(true)

      expect((183.25 - @apple.aibc(1)) < 0.01).to be(true)
      expect((138.5 - @yogurt.aibc(1)) < 0.01).to be(true)
      expect((44.25 - @chocolate.aibc(1)) < 0.01).to be(true)
      expect((186.5 - @glucose.aibc(1)) < 0.01).to be(true)
    end

    it "El alimento puede calcular el índice glucémico para un individuo" do
      expect((10.74 - @apple.individual_glycemic_index(0)) < 0.01)
      expect((8.496 - @yogurt.individual_glycemic_index(0)) < 0.01)
      expect((2.93 -  @chocolate.individual_glycemic_index(0)) < 0.01)

      expect((98.25 - @apple.individual_glycemic_index(1)) < 0.01)
      expect((74.26 - @yogurt.individual_glycemic_index(1)) < 0.01)
      expect((23.73 - @chocolate.individual_glycemic_index(1)) < 0.01)
    end

    it "El alimento puede calcular el índice glucémico" do
      expect((54.49 - @apple.glycemic_index) < 0.01).to be(true)
      expect((41.38 - @yogurt.glycemic_index) < 0.01).to be(true)
      expect((13.33 - @chocolate.glycemic_index) < 0.01).to be(true)
    end

  end

  context "Calculo de los gramos del alimento" do
    it "gramos totales del alimento" do
      expect((@food_vector[0].weight - 33.6) < 0.01).to be(true)
      expect((@food_vector[1].weight - 11.3) < 0.01).to be(true)
      expect((@food_vector[2].weight - 8.7) < 0.01).to be(true)
      expect((@food_vector[3].weight - 27.8) < 0.01).to be(true)
      expect((@food_vector[4].weight - 24.2) < 0.01).to be(true)
    end
  end

end
