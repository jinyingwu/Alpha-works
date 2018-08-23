def reverser
  result = []
  yield.split.each do |ele|
    result << ele.reverse
  end
  result.join(" ")
end


def adder(num = 1)
  yield + num
end

def repeater(n = 1, &prc)
  n.times do
    prc.call
  end
end
