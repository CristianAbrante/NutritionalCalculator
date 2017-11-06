
module NutritionalCalculator
  class FoodGroup < NutritionalCalculator::Food

    attr_reader :group

    def initialize(name, proteins, carbohydrates, lipids, group)
      @group = group
      super(name, proteins, carbohydrates, lipids)
    end

    def to_s
      super.to_s + " grupo(#{@group})"
    end

  end
end
