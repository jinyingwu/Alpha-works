

def add(num1, num2)
  num1 + num2
end


def subtract(num1, num2)
  num1 - num2
end

def sum(arr)
  sum = 0
  arr.each do |num|
    sum += num
  end
  sum
end

def mult(num1, num2, num3 = 1)
  num1 * num2 * num3
end

def pow(num, pow)
  result = 1
  pow.times do
    result *= num
  end
  result
end

def fact(n)
  result = 1
  (1..n).each do |num|
    result *= num
  end
  result
end
