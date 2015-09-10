class Array
  def bubble_sort

    loop do
      swapped = false

      i = 0
      while i < (self.length - 1)
        top = self[i + 1]
        bot = self[i]

        if bot > top
          self[i], self[i + 1] = top, bot
          swapped = true
        end

        i += 1
      end

      break if swapped == false
    end

    self
  end
end
