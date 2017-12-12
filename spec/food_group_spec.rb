require "spec_helper"

RSpec.describe NutritionalCalculator::FoodGroup do

  context "Comprobamos la clase y jerarquía del objeto" do

    before :each do
      @food1 = NutritionalCalculator::FoodGroup.new("Huevo frito", 14.1, 0.0, 19.5, "Huevos, lácteos y helados")
    end

    it "El objeto creado es de la clase food" do
      expect(@food1.class).to eq(NutritionalCalculator::FoodGroup)
      expect(@food1.instance_of?NutritionalCalculator::FoodGroup).to eq(true)
    end

    it "El objeto creado pertenece a la jerarquía de clases Food" do
      expect(@food1.is_a?NutritionalCalculator::Food).to eq(true)
      expect(@food1.kind_of?NutritionalCalculator::Food).to eq(true)
    end

    it "Almacenamiento del grupo del alimento" do
      expect(@food1.group).to eq("Huevos, lácteos y helados")
    end

    it "Muestra por pantalla formateado el alimento" do
      expect(@food1.to_s).to eq("Huevo frito -> proteínas(14.1) glúcidos(0.0) lípidos(19.5) grupo(Huevos, lácteos y helados)")
    end

  end

  context "Creamos una lista grupos de alimentos" do

    before :each do

      food_group_vector = NutritionalCalculator::get_food_vector 'lib/files/nutritional_group.config'

      @foodgroup0 = NutritionalCalculator::LinkedList.new
      @foodgroup1 = NutritionalCalculator::LinkedList.new
      @foodgroup2 = NutritionalCalculator::LinkedList.new
      @foodgroup3 = NutritionalCalculator::LinkedList.new
      @foodgroup4 = NutritionalCalculator::LinkedList.new
      @foodgroup5 = NutritionalCalculator::LinkedList.new
      @foodgroup6 = NutritionalCalculator::LinkedList.new

      food_group_vector.each do |food|

        case food.group
        when "Huevos, lácteos y helados"
          @foodgroup0.push_back(food)
        when "Carnes y derivados"
          @foodgroup1.push_back(food)
        when "Pescados y mariscos"
          @foodgroup2.push_back(food)
        when "Alimentos grasos"
          @foodgroup3.push_back(food)
        when "Alimentos ricos en carbohidratos"
          @foodgroup4.push_back(food)
        when "Verduras y Hortalizas"
          @foodgroup5.push_back(food)
        when "Frutas"
          @foodgroup6.push_back(food)
        end


      end

    end

    it "Comprobamos el nombre de los alimentos" do
      expect(@foodgroup2.front.name).to eq("Bacalao")
      expect(@foodgroup1.back.name).to eq("Pollo")
      expect(@foodgroup5[1].name).to eq("Cebolla")
      expect(@foodgroup4.front.name).to eq("Azúcar")
    end

    it "Comprobamos el valor de algunos atributos" do
      expect(@foodgroup2[1].lipids).to eq(15.5)
      expect(@foodgroup4.front.proteins).to eq(0.0)
      expect(@foodgroup6.back.carbohydrates).to eq(12.7)
    end

    it "Comprobamos el valor del índice calórico" do
      expect(@foodgroup0[0].get_nutritional_value).to eq(231.9)
      expect(@foodgroup0[1].get_nutritional_value).to eq(61.2)
      expect(@foodgroup0[2].get_nutritional_value).to eq(69.0)
    end

    it "Impresión de las listas" do
      puts @foodgroup0
      puts @foodgroup1
      puts @foodgroup2
    end

  end

  context "Comprobamos si se pueden comparar dos alimentos" do
    before :each do
      @egg =  NutritionalCalculator::FoodGroup.new("Huevo Frito", 14.1, 0.0, 19.5, "Huevos, lácteos y helados")
      @milk = NutritionalCalculator::FoodGroup.new("Leche de vaca", 3.8, 4.8, 3.2, "Huevos, lácteos y helados")
      @egg2 = NutritionalCalculator::FoodGroup.new("Huevo Frito", 14.1, 0.0, 19.5, "Huevos, lácteos y helados")
    end

    it "Comparamos la igualdad de dos alimentos" do
      expect(@egg == @egg2).to eq(true);
      expect(@egg == @milk).to eq(false);
    end

    it "Comparamos si los alimentos son menores o mayores (basado en su valor nutricional)" do
      expect(@egg < @milk).to eq(false);
      expect(@egg > @milk).to eq(true);
      expect(@egg <= @egg2).to eq(true);
      expect(@egg >= @egg2).to eq(true);
    end

    it "Comparamos si los alimentos están dentro de un rango(basado en su valor nutricional)" do
      @yogurt = NutritionalCalculator::FoodGroup.new("yogurt", 3.8, 4.9, 3.8, "Huevos, lácteos y helados")

      expect(@yogurt.between?(@milk, @egg)).to eq(true)
      expect(@egg2.between?(@yogurt, @egg)).to eq(true)
      expect(@milk.between?(@yogurt, @egg)).to eq(false)
    end

  end

  context "Comprobamos la ordenación de los vectores de alimentos" do

    before :each do
      @food_vector = NutritionalCalculator::get_food_vector  "lib/files/nutritional_file.txt"
      @sorted_vector = [@food_vector[2], @food_vector[1], @food_vector[4], @food_vector[3], @food_vector[0]]
    end

    it "Ordenamos de manera imperativa (blucles for)" do
      expect(@food_vector.sort_using_for).to eq(@sorted_vector)
    end

    it "Ordenamos de manera funcional (utilizando each)" do
      expect(@food_vector.sort_using_each).to eq(@sorted_vector)
    end

    it "Ordenamos mediante el método de la clase Array (sort)" do
      expect(@food_vector.sort).to eq(@sorted_vector)
    end

  end

  context "Comprobamos la eficiencia de los algoritmos de ordenación" do
    it "Coprobación utilizando Benchmark" do
      @food_vector = NutritionalCalculator::get_food_vector  "lib/files/nutritional_group.config"
      Benchmark.bm do |x|
        x.report("sort con for")   { @food_vector.sort_using_for }
        x.report("sort con each")  { @food_vector.sort_using_each  }
        x.report("sort de array")  { @food_vector.sort }
      end
    end
  end

end
