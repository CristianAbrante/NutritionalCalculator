
module NutritionalCalculator

  class Food

    PROTEINS_VALUE = 4.0
    CARBOHYDRATE_VALUE = 4.0
    LIPIDS_VALUE = 9.0

    attr_reader :name

    def initialize(name)
      @name = name
    end

  end

end
