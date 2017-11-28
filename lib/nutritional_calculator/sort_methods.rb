
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

  
end
