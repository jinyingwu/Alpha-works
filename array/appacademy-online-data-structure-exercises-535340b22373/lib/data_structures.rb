# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  max = arr.max
  min = arr.min

  max - min
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  arr == arr.sort
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  vowels = ["a", "e", "i", "o", "u", "A", "E", "I","O", "U"]
  count = 0

  chars = str.chars

  chars.each do |le|
    if vowels.index(le) != nil
      count += 1
    end

  end

  count
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  vowels = ["a", "e", "i", "o", "u", "A", "E", "I","O", "U"]

  vowels.each do |ele|
    str.delete!(ele)
  end
  str
end


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  nArray = int.to_s.chars.to_a
  nArray.sort{|x,y| y <=> x}
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  dStr = str.downcase.chars
  checkStr = ""

  dStr.each do |char|
    if checkStr.index(char) != nil
      return true
    else
      checkStr += char
    end
  end
  false
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  string = "(" + arr[0..2].join + ") " + arr[3..5].join + "-" + arr[6..9].join
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  max = str.delete(",").chars.max
  min = str.delete(",").chars.min

  max.to_i - min.to_i
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  modOffset = offset % arr.length
  arr.drop(modOffset).concat(arr.take(modOffset))
end
