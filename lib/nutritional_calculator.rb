
require 'nutritional_calculator/food'
require 'nutritional_calculator/linkedlist'
require 'nutritional_calculator/foodgroup'
require 'nutritional_calculator/sort_methods'

# encoding: utf-8
# El módulo se crea para describir los distintos elementos
# que compondrán una calculadora nutricional de alimentos.
# Author:: Cristian Abrante (mailto: alu0100945850@ull.edu.es)
# Copyright:: Creative Commons
# License:: Distributed under the same license as Ruby.

module NutritionalCalculator

  # Método que lee la configuración del fichero y devuelve un vector de los alimentos.

  def self.get_food_vector(file_name)

    food_vector = Array.new

    File.open(file_name, "r") do |file|
      file.each_line do |line|

        check_food_name = true
        nutritional_values = Array.new
        food_name = ""
        food_group = ""

        line.split(" ").each_with_index do |element, i|
          if element.to_f == 0.0 and element != "#{element.to_f}"
            if check_food_name
              food_name += element + " "
            else
              food_group += element + " "
            end
          else
            check_food_name = false
            nutritional_values.push(element.to_f)
          end
        end

        if food_group.empty?
          food_vector.push(NutritionalCalculator::Food.new(food_name.chop, nutritional_values[0], nutritional_values[1], nutritional_values[2]))
        else
          food_vector.push(NutritionalCalculator::FoodGroup.new(food_name.chop, nutritional_values[0], nutritional_values[1], nutritional_values[2], food_group.chop))
        end

      end
    end
    food_vector
  end

end
