require_relative "./HashMap"

class HashSet < HashMap
  
  def set(key)
    if self.has?(key) then
      return  
    end
    i = self.hash(key)
    raise IndexError if i.negative? || i >= @buckets.length
    bucket = @buckets[i]
    bucket << [key]
    @entries += 1
    if @entries > @load_factor*@capacity then
      repopulate = self.entries()
      @capacity = 2*@capacity
      self.clear()
      for entry in repopulate do
        self.set(entry)
      end
    end
  end

  def get(key)
    raise NoMethodError
  end

  def has?(key)
    i = self.hash(key)
    raise IndexError if i.negative? || i >= @buckets.length
    bucket = @buckets[i]
    return bucket.include?([key])
  end

  def values
    raise NoMethodError
  end

  def entries
    return self.keys
  end

  def to_s
    return self.keys.to_s
  end
end