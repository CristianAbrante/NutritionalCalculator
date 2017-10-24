#require "nutritional_calculator/version"

module NutritionalCalculator

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

end
