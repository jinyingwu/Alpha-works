require "byebug"
class Fixnum
  def in_words
    result = []
    if self < 100
      result = mod(self)
    elsif self > 99 && self < 1000
      result = less1000(self)
    elsif self > 999 && self < 1000000
      result = lessMil(self)
    elsif self > 999999 && self < 1000000000
      result = lessBil(self)
    elsif self > 999999999 && self < 100000000000
      result = lessTri(self)
    else
      result = trillion(self)
    end

    output(result)
  end

  def less10(num)
    numHsh = {
      0 => "zero",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine"
    }
    numHsh[num]
  end

  def ten_to_19(num)
    numHsh = {
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen"
    }

    numHsh[num]
  end

  def less100(num)
    numHsh = {
      2 => "twenty",
      3 => "thirty",
      4 => "forty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety"
    }
    #byebug
    strNum = []
    strNum << numHsh[num / 10 % 10]
    if num % 10 != 0
      strNum << less10(num % 10)
    end
    strNum
  end

  def less1000(num)
    strNum = []
    if (num / 100 % 10) != 0
      strNum << mod(num / 100 % 10)
      strNum << "hundred"
    end
    
    if num % 100 != 0
      strNum << mod(num % 100)
    end
    strNum
  end

  def lessMil(num)
    strNum = []
    modNum = num / 1000 % 1000
    if modNum < 100
      strNum << mod(modNum)
    else
      strNum << less1000(modNum)
    end
    strNum << "thousand"

    if num % 1000 != 0
      strNum << less1000(num % 1000)
    end
    strNum
  end

  def lessBil(num)
    #byebug
    strNum = []
    modNum = num / 1000000 % 1000
    if modNum < 100
      strNum << mod(modNum)
    else
      strNum << less1000(modNum)
    end
    strNum << "million"
    #byebug
    if num % 1000000 < 100 && num % 1000000 != 0
      strNum << mod(num % 1000000)
    elsif num % 1000000 != 0
      strNum << lessMil(num % 1000000)
    end
    strNum
  end

  def lessTri(num)
    strNum = []
    modNum = num / 1000000000 % 1000
    if modNum < 100
      strNum << mod(modNum)
    else
      strNum << less1000(modNum)
    end
    strNum << "billion"

    if num % 1000000000 < 100 && num % 1000000000 != 0
      strNum << mod(num % 1000000000)
    elsif num % 1000000000 != 0
      strNum << lessBil(num % 1000000000)
    end
    strNum
  end

  def trillion(num)
    strNum = []
    modNum = num / 1000000000000 % 1000
    if modNum < 100
      strNum << mod(modNum)
    else
      strNum << less1000(modNum)
    end
    strNum << "trillion"

    if num % 1000000000000 < 100 && num % 1000000000000 != 0
      strNum << mod(num % 1000000000000)
    elsif num % 1000000000000 != 0
      strNum << lessTri(num % 1000000000000)
    end
    strNum
  end

  def mod(num)
    result = []
    modNum = num % 100
    if modNum > 19 && modNum < 100
      result = less100(modNum)
    elsif modNum < 20 && modNum > 9
      result = ten_to_19(modNum)
    else
      result = less10(modNum)
    end
    result
  end

  def output(arr)
    if arr.class == Array
      str = arr.join(" ")
    else
      str = arr
    end
    str
  end
end
