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

  describe NutritionalCalculator::LinkedList::Node do

    before :each do
      @node1 = NutritionalCalculator::LinkedList::Node.new("a", nil, nil)
      @node2 = NutritionalCalculator::LinkedList::Node.new("b", nil, @node1)
      @node3 = NutritionalCalculator::LinkedList::Node.new("c", nil, @node2)

      @node1.next = @node2
      @node2.next = @node3
    end

    it "probar el enlace al nodo anterior" do
      expect(@node1.prev).to eq(nil)
      expect(@node2.prev).to eq(@node1)
      expect(@node3.prev).to eq(@node2)
    end

    it "probar el valor que contiene el nodo" do
      expect(@node1.value).to eq("a")
      expect(@node2.value).to eq("b")
      expect(@node3.value).to eq("c")
    end

    it "probar el enlace al nodo posterior" do
      expect(@node1.next).to eq(@node2)
      expect(@node2.next).to eq(@node3)
      expect(@node3.next).to eq(nil)
    end
  end

  describe NutritionalCalculator::LinkedList do

    before :each do
      @value_list = NutritionalCalculator::LinkedList.new
    end

    context "inserción de elementos" do
      it "Inserción de un elemento por la cola" do
        @value_list.push_back 1
        @value_list.push_back 2
        @value_list.push_back 3

        expect(@value_list.to_s).to eq("1 <-- 2 <-- 3")
      end

      it "Inserción de un elemento por la cabeza" do
        @value_list.push_front 0
        @value_list.push_front -1
        @value_list.push_front -2

        expect(@value_list.to_s).to eq("-2 <-- -1 <-- 0")
      end

      it "Inserción de varios elementos a la vez" do
        @value_list.insert -2, -1, 0, 1, 2, 3

        expect(@value_list.to_s).to eq("-2 <-- -1 <-- 0 <-- 1 <-- 2 <-- 3")
      end
    end

    context "Extracción de elementos" do

      before :each do
        @value_list.insert -2, -1, 0, 1, 2, 3
      end

      it "Extracción del primer elemento de la lista" do
        @value_list.pop_front
        expect(@value_list.to_s).to eq("-1 <-- 0 <-- 1 <-- 2 <-- 3")
      end

      it "Extracción del último elemento de la lista" do
        @value_list.pop_back
        expect(@value_list.to_s).to eq("-2 <-- -1 <-- 0 <-- 1 <-- 2")
      end

      it "Extracción de un elemento dado un valor" do
        @value_list.erase 0
        expect(@value_list.to_s).to eq("-2 <-- -1 <-- 1 <-- 2 <-- 3")

        @value_list.erase 1
        expect(@value_list.to_s).to eq("-2 <-- -1 <-- 2 <-- 3")
      end
    end

    context "Acceso de elementos" do

      before :each do
        @value_list.insert -2, -1, 0, 1, 2, 3
      end

      it "Acceso al primer elemento de la lista" do
        expect(@value_list.front).to eq(-2)
      end

      it "Acceso alúltimo elemento de la lista" do
        expect(@value_list.back).to eq(3)
      end

      it "Acceso a un elemento dada una posición concreta" do
        expect(@value_list[2]).to eq(0)
      end
    end

  end

end

RSpec.describe NutritionalCalculator::FoodGroup do

  context "Comprobamos la clase y jerarquía del objeto" do

    before :each do
      @food1 = NutritionalCalculator::FoodGroup.new("Huevo Frito", 14.1, 0.0, 19.5)
    end

    it "El objeto creado es de la clase food" do
      expect(@food1.class).to eq(NutritionalCalculator::FoodGroup)
      expect(@food1.instance_of?NutritionalCalculator::FoodGroup).to eq(true)
    end

    it "El objeto creado pertenece a la jerarquía de clases Food" do
      expect(@food1.is_a?NutritionalCalculator::Food).to eq(true)
      expect(@food1.kind_of?NutritionalCalculator::Food).to eq(true)
    end
  end

end
