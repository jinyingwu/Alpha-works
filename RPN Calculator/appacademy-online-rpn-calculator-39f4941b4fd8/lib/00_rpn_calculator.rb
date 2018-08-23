require "byebug"
class RPNCalculator
  def initialize
    @calculator = []
  end

  def push(num)
    @calculator << num
  end

  def plus
    raise "calculator is empty" unless num1 = @calculator.pop
    raise "calculator is empty" unless num2 = @calculator.pop
    @calculator.push(num1 + num2)
  end

  def minus
    raise "calculator is empty" unless num1 = @calculator.pop
    raise "calculator is empty" unless num2 = @calculator.pop
    @calculator.push(num2 - num1)
  end

  def divide
    raise "calculator is empty" unless num1 = @calculator.pop.to_f
    raise "calculator is empty" unless num2 = @calculator.pop.to_f
    @calculator.push(num2 / num1)
  end

  def times
    raise "calculator is empty" unless num1 = @calculator.pop.to_f
    raise "calculator is empty" unless num2 = @calculator.pop.to_f
    @calculator.push(num2 * num1)
  end

  def tokens(string)
    #byebug
    result = []
    hsh = {"+" => :+, "-" => :-, "*" => :*, "/" => :/}

    string.split.each do |el|
      #byebug
      if hsh[el] == nil
        result << el.to_i
      else
        result << hsh[el]
      end
    end
    result
  end

  def evaluate(string)
    hsh = {"+" => :+, "-" => :-, "*" => :*, "/" => :/}
    numArr = []
    signArr = []
    #result = 0

    string.split.each do |el|
      if hsh[el] == nil
        numArr << el.to_i
      else
        signArr << hsh[el]
      end
    end

    signArr.each do |el|
      case el
      when :+
        num1 = numArr.pop
        num2 = numArr.pop
        numArr.push(num1 + num2)
      when :-
        num1 = numArr.pop
        num2 = numArr.pop
        numArr.push(num2 - num1)
      when :*
        num1 = numArr.pop
        num2 = numArr.pop
        numArr.push(num2 * num1.to_f)
      else
        num1 = numArr.pop
        num2 = numArr.pop
        numArr.push(num2 / num1.to_f)
      end
    end

    numArr[-1]
  end

  def value
    @calculator[-1]
  end
end
