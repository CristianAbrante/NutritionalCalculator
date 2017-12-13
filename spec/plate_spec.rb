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
      expect(@test_plate.vegetables["Tomate"]).to eq("2 piezas")
    end

    it "El alimento debe poder almacenar y acceder a las frutas" do
      @test_plate.fruit "Plátano", :amount => "20 gr"
      expect(@test_plate.fruits["Plátano"]).to eq("20 gr")
    end

    it "El alimento debe poder almacenar y acceder a los cereales" do
      @test_plate.cereal "Arroz", :amount => "1 taza grande"
      expect(@test_plate.cereals["Arroz"]).to eq("1 taza grande")
    end

    it "El alimento debe poder almacenar y acceder a las proteínas" do
      @test_plate.protein "Lentejas", :amount => "1/2 taza"
      expect(@test_plate.proteins["Lentejas"]).to eq("1/2 taza")
    end

    it "El alimento debe poder almacenar y acceder a los aceites" do
      @test_plate.oil "Aceite de oliva", :amount => "1 chorrito"
      expect(@test_plate.oils["Aceite de oliva"]).to eq("1 chorrito")
    end

    it "El alimento debe poder almacenar y acceder a las bebidas" do
      @test_plate.drink "agua", :amount => "1 litro"
      expect(@test_plate.drinks["agua"]).to eq("1 litro")
    end

    it "El alimento debe poder almacenar los datos si lo pasamos como bloque" do
      test_plate_2 = NutritionalCalculator::Plate.new("prueba2") do |a|
        vegetable "Tomate", :amount => "2 piezas"
        fruit "Plátano", :amount => "20 gr"
        cereal "Arroz", :amount => "1 taza grande"
        protein "Lentejas", :amount => "1/2 taza"
        oil "Aceite de oliva", :amount => "1 chorrito"
        drink "agua", :amount => "1 litro"
      end

      expect(test_plate_2.vegetables["Tomate"]).to eq("2 piezas")
      expect(test_plate_2.fruits["Plátano"]).to eq("20 gr")
      expect(test_plate_2.cereals["Arroz"]).to eq("1 taza grande")
      expect(test_plate_2.proteins["Lentejas"]).to eq("1/2 taza")
      expect(test_plate_2.oils["Aceite de oliva"]).to eq("1 chorrito")
      expect(test_plate_2.drinks["agua"]).to eq("1 litro")
    end
  end
end
