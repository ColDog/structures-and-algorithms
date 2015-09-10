class Array
  def insertion_sort
    self.each_with_index do |el, idx|
      inside_idx = idx - 1
      while inside_idx >= 0
        if el < self[inside_idx]
          self[inside_idx + 1], self[inside_idx] = self[inside_idx], self[inside_idx + 1]
        end
        inside_idx -= 1
      end
    end
    self
  end
end
