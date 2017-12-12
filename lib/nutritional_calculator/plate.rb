
module NutritionalCalculator

  # Esta clase representa al plato Harvard
  # Este plato tiene partes diferenciadas
  # Además es capaz de calcular el valor nutricional respecto a una base de datos

  class Plate

    # Atributos que podremos leer
    attr_reader :name

    # Constructor de la clase
    # @param name [string] nombre que tendrá el plato
    def initialize(name)
      @name = name
    end

  end
end
