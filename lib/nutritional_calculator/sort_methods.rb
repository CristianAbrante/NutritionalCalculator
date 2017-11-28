
class Array

  def sort_using_for
    sorted_array = self.dup
    for i in 1...sorted_array.length do
      for j in (i..sorted_array.length-1).to_a.reverse do

        if sorted_array[j] < sorted_array[j-1]
          tmp = sorted_array[j-1]
          sorted_array[j-1] = sorted_array[j]
          sorted_array[j] = tmp
        end

      end
    end
    sorted_array
  end

  def sort_using_each
    copy = []
    self.each do |element|
      index = (0...copy.size).bsearch { |n| copy[n] > element }

      if index
        copy.insert(index, element)
      else
        copy << element
      end

    end
    copy
  end
end
