
module NutritionalCalculator

  # Clase concreta de un alimento
  # Contiene además el grupo al que pertenece el alimento.

  class FoodGroup < NutritionalCalculator::Food

    attr_reader :group

    # Constructor.
    # @param name [String] Nombre del alimento que queremos representar.
    # @param proteins [float] Gramos de proteína que contiene el alimanto.
    # @param carbohydrates [float] Gramos de glúcidos que contiene el alimanto.
    # @param lipids [float] Gramos de lípidos que contiene el alimanto.
    # @param group [String] Nombre del grupo al que pertenece el alimento.

    def initialize(name, proteins, carbohydrates, lipids, group)
      @group = group
      super(name, proteins, carbohydrates, lipids)
    end

    # Método que transforma el objeto en un String.
    # De esta forma será formateado por pantalla.
    # @return [String] String con el objeto formateado.

    def to_s
      super.to_s + " grupo(#{@group})"
    end

  end
end
