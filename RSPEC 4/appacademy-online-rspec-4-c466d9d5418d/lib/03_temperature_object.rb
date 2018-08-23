require "byebug"
class Temperature
  def initialize(arg)
    byebug
    if arg[:f]
      self.fahrenheit = arg[:f]
    else
      self.celsius = arg[:c]
    end
  end

  def in_fahrenheit
    self.class.c_to_f(@temp)
  end

  def in_celsius
    @temp
  end

  def fahrenheit=(temp)
    @temp = self.class.f_to_c(temp)
  end

  def celsius=(temp)
    @temp = temp
  end


  def self.from_fahrenheit(temp)
    self.new(f: temp)
  end

  def self.from_celsius(temp)
    self.new(c: temp)
  end


  def self.f_to_c(f_num)
    ((f_num - 32) / 1.8).round
  end

  def self.c_to_f(c_num)
    (c_num * 1.8) + 32
  end
end


# Subclasses/Inheritance
class Celsius < Temperature
  def initialize(temp)
    self.celsius = temp
  end
end



class Fahrenheit < Temperature
  def initialize(temp)
    self.fahrenheit = temp
  end
end
