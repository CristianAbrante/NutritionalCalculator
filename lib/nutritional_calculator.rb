
# encoding: utf-8
# El módulo se crea para describir los distintos elementos
# que compondrán una calculadora nutricional de alimentos.
# Author:: Cristian Abrante (mailto: alu0100945850@ull.edu.es)
# Copyright:: Creative Commons
# License:: Distributed under the same license as Ruby.

module NutritionalCalculator

  # Método que lee la configuración del fichero.

  def self.read_nutritional_file(file_name)

    nutritional_hash = Hash.new

    File.open(file_name, "r") do |f|

      f.each_line do |line|
        vector = line.split(" ")

        if vector.length == 4
          nutritional_hash[vector[0]] = vector[1...4].map {|value| value.to_f}
        else

          pos = 1
          food_name = vector[0]

          while vector[pos].to_f == 0.0 && vector[pos] != "#{vector[pos].to_f}"
            food_name += " " + vector[pos]
            pos += 1
          end

          nutritional_hash[food_name] = vector[pos...vector.length].map {|value| value.to_f}
        end

      end

    end

    return nutritional_hash

  end

# Método que lee la configuración del fichero para un grupo de alimentos.

  def self.read_nutritional_groups(file_name)

    nutritional_groups = Hash.new

    File.open(file_name, "r") do |f|
      f.each_line do |line|

        vector = line.split(" ")

        num_pos = 1
        food_name = "#{vector[0]}"

        while vector[num_pos].to_f == 0.0 && vector[num_pos] != "#{vector[num_pos].to_f}"
          food_name += " " + "#{vector[num_pos]}"
          num_pos += 1
        end

        food_group = ""
        for chunk in vector[(num_pos + 3)...vector.length] do
            food_group += "#{chunk} "
        end

        vector_of_food = vector[num_pos...num_pos + 3].map {|value| value.to_f}
        vector_of_food[3] = food_group

        nutritional_groups[food_name] = vector_of_food

      end
    end

    nutritional_groups

  end

end
