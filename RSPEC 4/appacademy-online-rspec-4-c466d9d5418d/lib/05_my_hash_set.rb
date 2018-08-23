class MyHashSet
  attr_accessor :store

  def initialize
    @store = {}
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    if @store[el]
      return true
    else
      return false
    end
  end

  def delete(el)
    @store.delete(el)
  end

  def to_a
    arr = []
    @store.each_key do |k|
      arr << k
    end
    arr
  end

  def union(set)
    result = self.class.new
    self.to_a.each do |ele|
      result.insert(ele)
    end
    set.to_a.each do |ele|
      result.insert(ele)
    end

    result
  end

  def intersect(set)
    result = self.class.new
    self.to_a.each do |ele|
      result.insert(ele) if set.include?(ele)
    end
    result
  end

  def minus(set)
    result = self.class.new
    self.to_a.each do |ele|
      result.insert(ele) unless set.include?(ele)
    end
    result
  end

  def symmetric_difference(set)
    result1 = self.class.new

    self.to_a.each do |ele|
      result1.insert(ele) unless set.include?(ele)
    end

    set.to_a.each do |ele|
      result1.insert(ele) unless self.include?(ele)
    end

    result1
  end

  def ==(obj)
    if obj.class == MyHashSet
      self.to_a.each do |ele|
        return false unless obj.include?(ele)
      end
    else
      return false
    end

    true
  end

  def each(&prc)
    self.to_a.each do |ele|
      prc.call(ele)
    end 
  end
end
