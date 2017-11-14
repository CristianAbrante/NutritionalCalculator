

module NutritionalCalculator

  # Clase que representa a una lista doblemente enlazada.

  class LinkedList

    include Enumerable;

    # Estructura que representa a un nodo de la lista enlazada.
    Node = Struct.new(:value, :next, :prev)

    # Constructor que inicializa una lista vacía.
    def initialize

      # Atribute that represents the head
      # of the list.
      @head = nil

      # Atribute that represents the tail
      # of the list.
      @tail = nil
    end

    # -- ISERTION METHODS

    # Método que inseta un valor por la parte posterior de la lista.
    # @param value [value] Valor que queremos insertar.

    def push_back(value)
      if @head == nil
        @head = Node.new(value, nil, nil)
        @tail = @head
      else
        current_node = Node.new(value, nil, @tail)
        @tail.next = current_node
        @tail = current_node
      end
    end

    # Método que inseta un valor por la parte delantera de la lista.
    # @param value [value] Valor que queremos insertar.

    def push_front(value)
      if @head == nil
        @head = Node.new(value, nil, nil)
        @tail = @head
      else
        current_node = Node.new(value, @head, nil)
        @head.prev = current_node
        @head = current_node
      end
    end

    # Método que inserta un conjunto de valores por la parte posterior de la lista.
    # @param values [value] conjunto de elementos que queremos insertar en la lista.

    def insert(*values)
      values.each do |value|
        push_back(value)
      end
    end

    # -- EXTRACTION METHODS

    # Método que extrae el último elemento posterior de la lista

    def pop_back
      if @head == @tail
        @head = @tail = nil
      else
        if @tail
          @tail = @tail.prev
          @tail.next = nil;
        end
      end
    end

    # Método que extrae el primer elemento de la lista.

    def pop_front
      if @head == @tail
        @head = @tail = nil
      else
        if @head
          @head = @head.next
          @head.prev = nil;
        end
      end
    end

    # Método que busca la primera ocurrencia de un elemento en la lista
    # y lo elimina.
    # @param value [value] [value] Valor que pretendemos eliminar.

    def erase(value)

      if @head and @head.value == value
        pop_front
      elsif @tail and @tail.value == value
        pop_back
      else

        current_node = @head
        while current_node

          if current_node.value == value
            current_node.prev.next = current_node.next
            current_node.next.prev = current_node.prev
          end

          current_node = current_node.next
        end

      end
    end

    # -- ACCESS METHODS

    # Método que accede al valor del primer elemento de la lista.
    # @return [value, nil] Primer elemento de la lista.

    def front
      if @head
        @head.value
      else
        nil
      end
    end

    # Método que accede al último elemento de la lista.
    # @return [value, nil] Último elemento de la lista.

    def back
      if @tail
        @tail.value
      else
        nil
      end
    end

    # Método que accede a un elemento dada su posición en la lista.
    # @param pos [number] Posición del elemento en la lista.
    # @return [value,nil] Elemento que se encuentra en la posición pos.

    def [] (pos)

      current_node = @head
      i = 0
      while current_node and i != pos
        current_node = current_node.next
        i += 1
      end
      if current_node
        current_node.value
      else
        nil
      end
    end

    # Método que pasa a cada elemento de la lista un bloque para que se ejecute.

    def each
      current_node = @head
      while current_node
        yield current_node.value
        current_node = current_node.next
      end
    end

    # Método que transforma el objeto en un String.
    # De esta forma será formateado por pantalla.
    # @return [String] String con el objeto formateado.

    def to_s
      list_as_string = ""

      current_node = @head
      while current_node
        list_as_string += "#{current_node.value}"

        if current_node.next
          list_as_string += " <-- "
        end

        current_node = current_node.next
      end

      list_as_string
    end

  end
end
