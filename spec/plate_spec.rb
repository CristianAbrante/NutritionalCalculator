require "spec_helper"

RSpec.describe NutritionalCalculator::Plate do
  context "Comprobamos la creación y los diferentes atributos de la clase" do
    before :each do
      @test_plate = NutritionalCalculator::Plate.new("plato de prueba")
    end

    it "El nombre del plato se almacena correctamente" do
      expect(@test_plate.name).to eq("plato de prueba")
    end

    it "Testeamos la base de datos del plato" do
      test_database = NutritionalCalculator::get_food_vector("lib/files/food_database.config")

      pos = 0
      @test_plate.food_database.each do |food_name, food|
        expect(test_database[pos] == food).to be(true)
        pos += 1
      end
    end

    it "El alimento debe poder almacenar y acceder a los vegetales" do
      @test_plate.vegetable "Tomate", :amount => "2 piezas"
      expect(@test_plate.vegetables["Tomate"]).to be("2 piezas")
    end

    it "El alimento debe poder almacenar y acceder a las frutas" do
      @test_plate.fruit "Plátano", :amount => "20 gr"
      expect(@test_plate.fruits["Plátano"]).to be("20 gr")
    end

    it "El alimento debe poder almacenar y acceder a los cereales" do
      @test_plate.cereal "Arroz", :amount => "1 taza grande"
      expect(@test_plate.cereals["Arroz"]).to be("1 taza grande")
    end

    it "El alimento debe poder almacenar y acceder a las proteínas" do
      @test_plate.protein "Lentejas", :amount => "1/2 taza"
      expect(@test_plate.vegetables["Lentejas"]).to be("1/2 taza")
    end

    it "El alimento debe poder almacenar y acceder a los aceites" do
      @test_plate.vegetable "Aceite de oliva", :amount => "1 chorrito"
      expect(@test_plate.vegetables["Aceite de oliva"]).to be("1 chorrito")
    end

    it "El alimento debe poder almacenar y acceder a las bebidas" do
      @test_plate.vegetable "agua", :amount => "1 litro"
      expect(@test_plate.vegetables["agua"]).to be("1 litro")
    end
  end
end
