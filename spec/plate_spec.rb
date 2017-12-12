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

  end
end
