
module NutritionalCalculator

  class Food

    PROTEINS_VALUE = 4.0
    CARBOHYDRATE_VALUE = 4.0
    LIPIDS_VALUE = 9.0

    attr_reader :name, :proteins, :carbohydrates, :lipids

    def initialize(name, proteins, carbohydrates, lipids)
      @name = name
      @proteins = proteins
      @carbohydrates = carbohydrates
      @lipids = lipids
    end

  end

end
