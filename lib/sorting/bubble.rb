class Array
  def bubble_sort

    loop do
      swapped = false

      i = 0
      while i < self.length

        if self[i] > self[i + 1]
          self[i], self[i + 1] = self[i + 1], self[i]
          swapped = true
        end

        i += 1
      end

      break if swapped = false
    end

    self
  end
end
