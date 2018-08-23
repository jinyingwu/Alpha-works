# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  al = ("a".."z").to_a

  al.each do |ele|
    str.delete!(ele)
  end
  str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  size = str.length
  index = size / 2

  if(size.odd?)
    return str[index]
  else
    return str[index - 1..index]
  end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  orSize = str.length
  copyStr = str

  VOWELS.each do |ele|
    copyStr.delete!(ele)
    copyStr.delete!(ele.upcase)
  end

  orSize - copyStr.length
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  product = 1
  (1..num).each do |n|
    product *= n
  end

  product
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  string = ""
  countDown = arr.length

  arr.each do |ele|

    if countDown != 1
      string += ele + separator
      countDown -= 1
    else
      string += ele
    end
  end

  string
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  result = ""
  str.chars.each_index do |index|
    if(index + 1).odd?
      result += str[index].downcase
    else
      result += str[index].upcase
    end
  end
  result
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  words = str.split
  result = []

  words.each do |word|
    if word.length > 4
      result << word.reverse
    else
      result << word
    end
  end
  result.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  result = []
  (1..n).each do |num|
    if num % 3  == 0 && num % 5 == 0
      result << "fizzbuzz"
    elsif  num % 3 == 0
      result << "fizz"
    elsif num % 5 == 0
      result << "buzz"
    else
      result << num
    end
  end
  result
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  result = []

  arr.each do |ele|
    result.unshift(ele)
  end

  result
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  if num < 2
    return false
  end

  (2...num).each do |n|
    if num % n == 0
      return false
    end
  end
  true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  result = []

  (1..num).each do |n|
    if num % n == 0
      result << n
    end
  end
  result
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  facArray = factors(num)
  result = []

  facArray.each do |n|
    if prime?(n)
      result << n
    end
  end
  result
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  even = []
  odd = []

  arr.each do |num|
    if num.odd?
      odd << num
    else
      even << num
    end
  end

  if even.length == 1
    return even[0]
  else
    return odd[0]
  end 
end
