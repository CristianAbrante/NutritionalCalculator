

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

    # ISERTION METHODS

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

    def insert(*values)
      values.each do |value|
        push_back(value)
      end
    end

    # EXTRACTION METHODS

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

    # Transform method

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
