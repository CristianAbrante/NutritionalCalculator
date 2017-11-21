
module NutritionalCalculator

  # Esta clase representa a un alimento de manera abstracta.
  # Contiene su nombre y su información nutricional.
  # Se ha incluido el módulo Comparable.

  class Food

    # valor nutricional de las proteinas: <b>4.0</b>
    PROTEINS_VALUE = 4.0

    # Valor nutricional de los glúcidos: <b>4.0</b>
    CARBOHYDRATE_VALUE = 4.0

    # Valor nutricional de los lípidos: <b>9.0</b>
    LIPIDS_VALUE = 9.0

    attr_reader :name, :proteins, :carbohydrates, :lipids, :glucose_concentration
    include Comparable

    # Constructor.
    # @param name [String] Nombre del alimento que queremos representar.
    # @param proteins [float] Gramos de proteína que contiene el alimanto.
    # @param carbohydrates [float] Gramos de glúcidos que contiene el alimanto.
    # @param lipids [float] Gramos de lípidos que contiene el alimanto.
    # @param glucose_concentration[Array[Array[float]]] listas de concentraciones de glucosa tras la ingesta del alimento para varios individuos.
    # @param glucose[Food] objeto glucosa de la clase Food, necesario para hacer los cálculos. Si el valor es nulo entonces es el objeto glucosa.

    def initialize(name, proteins, carbohydrates, lipids, glucose_concentration, glucose = nil)
      @name = name
      @proteins = proteins
      @carbohydrates = carbohydrates
      @lipids = lipids
      @glucose_concentration = glucose_concentration
      @glucose = glucose
    end

    # Método que transforma el objeto en un String.
    # De esta forma será formateado por pantalla.
    # @return [String] String con el objeto formateado.

    def to_s
      "#{@name} -> proteínas(#{@proteins}) glúcidos(#{@carbohydrates}) lípidos(#{@lipids})"
    end

    # Método que devuelve el valor nutricional del alimento.
    # El valor nutricional se calcula como la suma del producto
    # de los valores nutricionales de los macronutrientes por los gramos
    # de dicho macronutriente presente en el alimento.
    # @return [float] Valor nutricional del alimento

    def get_nutritional_value
      @proteins * PROTEINS_VALUE + @carbohydrates * CARBOHYDRATE_VALUE + @lipids * LIPIDS_VALUE
    end

    # Método que permite hacer al alimento Comparable.
    # En mi caso el criterio de comparación ha sido el valor
    # nutricional del alimento.
    # @param other [NutritionalCalculator::Food] alimento con el cual queremos comparar el alimento.

    def <=> (other)
      get_nutritional_value <=> other.get_nutritional_value
    end

    # Método que permite calcular el área incremental bajo la curva de las mediciones de glucosa de un alimento.
    # Se ha realizado mediante programación funcional.
    # @param individual [int] Individuo para el cual queremos calcular el AIBC del alimento.

    def aibc(individual)
      (1..24).lazy.map { |i| s_value(individual, i) }.map { |j| (5.0 / 2.0) * j }.reduce('+')
    end

    # Método que calcula el índice glucémico del alimento para un individuo concreto.
    # Se ha realizado mediante programación funcional.
    # @param individual [int] Individuo para el cual queremos calcular el índice glucémico del alimento.

    def individual_glycemic_index(individual)
      100.0 * (aibc(individual) / @glucose.aibc(individual))
    end

    private
    def s_value(individual, i)
      @glucose_concentration[individual][i] + @glucose_concentration[individual][i - 1] - 2 * @glucose_concentration[individual][0]
    end

  end

end
