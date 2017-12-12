require "spec_helper"

RSpec.describe NutritionalCalculator::Plate do
  context "Comprobamos la creación y los diferentes atributos de la clase" do
    before :each do
      @test_plate = NutritionalCalculator::Plate.new("plato de prueba")
    end

    it "El nombre del plato se almacena correctamente" do
      expect(@test_plate.name).to eq("plato de prueba")
    end

  end
end
