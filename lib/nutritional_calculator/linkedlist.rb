

module NutritionalCalculator

  # Class that represents a double
  # linked list.

  class LinkedList

    # List node structure definition.
    Node = Struct.new(:value, :next, :prev)

    # initialize an empty list
    def initialize

      # Atribute that represents the head
      # of the list.
      @head = nil

      # Atribute that represents the tail
      # of the list.
      @tail = nil
    end



  end
end
