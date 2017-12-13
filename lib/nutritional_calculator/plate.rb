
module NutritionalCalculator

  # Esta clase representa al plato Harvard
  # Este plato tiene partes diferenciadas
  # Además es capaz de calcular el valor nutricional respecto a una base de datos

  class Plate

    # Fichero donde se encuentra la base da datos de alimentos
    DATABASE_FILE = "lib/files/food_database.config"

    # Unidades

    PIECE = 50.0
    SLICE = 60.0
    PINCH = 2.0
    DRIBBLE = 1.5
    LITRE = 1000.0
    CENTILITRE = 10.0
    CUP = 20.0
    SPOON = 1.0

    # Multiplicadores

    BIG = 1.5
    SMALL = 0.5

    # Atributos que podremos leer
    attr_reader :name, :food_database, :vegetables, :fruits, :cereals, :proteins, :oils, :drinks, :nutritional_value

    # Constructor de la clase
    # @param name [string] nombre que tendrá el plato
    def initialize(name, &block)
      @name = name
      @food_database = read_food_database(DATABASE_FILE)

      @vegetables = {}
      @fruits = {}
      @cereals = {}
      @proteins = {}
      @oils = {}
      @drinks = {}

      @nutritional_value = 0.0

      if block_given?
        if block.arity == 1
          yield self
        else
         instance_eval(&block)
        end
      end

    end

    # Métodos para añadir elementos a las partes del plato.

    def vegetable(food_name, quantity = {})
        add_food_to_plate("vegetable", food_name, quantity[:amount]) if(quantity[:amount])
    end

    def fruit(food_name, quantity = {})
        add_food_to_plate("fruit", food_name, quantity[:amount]) if(quantity[:amount])
    end

    def cereal(food_name, quantity = {})
        add_food_to_plate("cereal", food_name, quantity[:amount]) if(quantity[:amount])
    end

    def protein(food_name, quantity = {})
        add_food_to_plate("protein", food_name, quantity[:amount]) if(quantity[:amount])
    end

    def oil(food_name, quantity = {})
        add_food_to_plate("oil", food_name, quantity[:amount]) if(quantity[:amount])
    end

    def drink(food_name, quantity = {})
        add_food_to_plate("drink", food_name, quantity[:amount]) if(quantity[:amount])
    end

    private

    # Método que lee la base da datos desde el fichero
    def read_food_database(database_file)

      food_database = Hash.new

      File.open(database_file, "r") do |f|
        f.each_line do |line|
          food_elements = line.split(" ")

          food_name = food_elements[0]
          current_pos = 1

          while food_elements[current_pos].to_f == 0.0 && food_elements[current_pos] != "#{food_elements[current_pos].to_f}"
            food_name += " " + food_elements[current_pos]
            current_pos += 1
          end

          food_attributes = food_elements[current_pos...food_elements.length].map {|element| element.to_f}
          food_database[food_name] = Food.new(food_name, food_attributes[0], food_attributes[1], food_attributes[2])
        end
      end

      food_database
    end

    def add_food_to_plate(food_kind, food_name, str_amount)
      case food_kind
      when "vegetable"
        @vegetables[food_name] = str_amount
      when "fruit"
        @fruits[food_name] = str_amount
      when "cereal"
        @cereals[food_name] = str_amount
      when "protein"
        @proteins[food_name] = str_amount
      when "oil"
        @oils[food_name] = str_amount
      when "drink"
        @drinks[food_name] = str_amount
      end

      gr_amount = str_amount_2_gr_amount(str_amount)
      @nutritional_value += calculate_nutritional_value(food_name, gr_amount)
    end

    def calculate_nutritional_value(food_name, gr_amount)
      food = @food_database[food_name]
      if !food.nil?
        (food.get_nutritional_value * gr_amount) / food.weight
      else
        0.0
      end
    end

    def str_amount_2_gr_amount(str_amount)

      quantity = str_amount.split(" ").shift.to_r.to_f  # Obtaining multiplier float
      str_unit = str_amount.split(" ").drop(1).join(" ")    # Obtaning name of the unit

      gr_unit = 0.0

      case str_unit
      when "g", "gr", "gramo","gramos"
        gr_unit = 1.0
      when "kg", "kilos", "kilogramos"
        gr_unit = 1000.0
      when"l", "litros"
        gr_unit = LITRE
      when "cl", "centilitros"
        gr_unit = LITRE
      end

      if !/piez/.match(str_unit).nil?
        gr_unit = PIECE
      end
      if !/rodaj/.match(str_unit).nil?
        gr_unit = SLICE
      end
      if !/troz/.match(str_unit).nil?
        gr_unit = SLICE
      end
      if !/taz/.match(str_unit).nil?
        gr_unit = CUP
      end
      if !/cuchar/.match(str_unit).nil?
        gr_unit = SPOON
      end
      if !/pizca/.match(str_unit).nil?
        gr_unit = PINCH
      end
      if !/chorr/.match(str_unit).nil?
        gr_unit = DRIBBLE
      end

      # In case unit has multiplicator
      # Unit must be multiplied by the small multiplicator.
      if !/pequeñ/.match(str_unit).nil?
        gr_unit * SMALL
      end
      # Unit must be multiplied by the big multiplicator.
      if !/grand/.match(str_unit).nil?
        gr_unit * BIG
      end

      quantity * gr_unit

    end
  end
end
