class HashMap

  attr_reader :capacity

  def initialize
    @capacity = 16
    @load_factor = 0.75
    @entries = 0
    @buckets = Array.new(@capacity).map {|x| []}
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code.modulo(@capacity)
  end

  def set(key, value)
    i = self.hash(key)
    raise IndexError if i.negative? || i >= @buckets.length
    bucket = @buckets[i]
    bucket.each.with_index do |(k , v), i|
      if k == key then
        bucket[i] = [key, value]
        return
      end
    end
    bucket << [key, value]
    @entries += 1
    if @entries > @load_factor*@capacity then
      repopulate = self.entries()
      @capacity = 2*@capacity
      self.clear()
      for entry in repopulate do
        self.set(entry[0], entry[1])
      end
    end
  end

  def get(key)
    i = self.hash(key)
    raise IndexError if i.negative? || i >= @buckets.length
    bucket = @buckets[i]
    bucket.each.with_index do |(k , v), i|
      if k == key then
        return v
      end
    end
    return nil
  end

  def has?(key)
    if self.get(key).nil?
      return false
    end
    return true
  end

  def remove(key)
    if !self.has?(key)
      return nil
    end
    i = self.hash(key)
    raise IndexError if i.negative? || i >= @buckets.length
    bucket = @buckets[i]
    to_del = 0
    ans = nil
    bucket.each.with_index do |(k , v), i|
      if k == key then
        to_del = i
        ans = v
      end
    end
    bucket.delete_at(to_del)
    @entries -= 1
    return ans
  end

  def length
    return @entries
  end

  def clear
    @entries = 0
    @buckets = Array.new(@capacity).map {|x| []}
  end

  def keys
    ans = []
    @buckets.each do |bucket|
      ans += bucket.map {|k, v| k}
    end
    return ans
  end

  def values
    ans = []
    @buckets.each do |bucket|
      ans += bucket.map {|k, v| v}
    end
    return ans.uniq
  end

  def entries
    return @buckets.flatten(1)
  end

  def to_s
    return @buckets.to_s
  end
end