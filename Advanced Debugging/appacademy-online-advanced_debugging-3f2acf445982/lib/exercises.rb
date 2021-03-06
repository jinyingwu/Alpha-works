require 'byebug'
class Array
  # Write a new Array method (using monkey-patching) that will return
  # the location of all identical elements. The keys are the
  # duplicated elements, and the values are arrays of their positions,
  # sorted lowest to highest.
  def dups
    positions = {}
    #byebug

    self.each_with_index do |item, index|
      if positions[item] == nil
        positions[item] = [index]
      else
        positions[item] << index
      end
    end

    positions.select { |key, val| val.length > 1 }
  end
end


class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pairs = []
    self.each_with_index do |el1, i|
      j = i + 1
      while j < self.length
        if el1 + self[j] == target
          pairs << [i, j]
        end
        j += 1
      end
    end
    pairs
  end
end


# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  letters = ("a".."z").to_a

  encoded_str = ""
  str.each_char do |char|
    if char == " "
      encoded_str << " "
      next
    end
#byebug
    old_idx = letters.find_index(char)
    new_idx = (old_idx.to_i + shift) % letters.count

    encoded_str << letters[new_idx]
  end

  encoded_str
end


# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  if alphabet == nil
    alphabet = ('a'..'z').to_a
  end

  sorted = true
  while sorted
    sorted = false

    str.length.times do |i|
      #byebug
      break unless i < str.length - 1

      if alphabet.index(str[i]) > alphabet.index(str[i + 1])
        str[i], str[i + 1] = str[i + 1], str[i]
        i += 1
        sorted = true
      end
    end
  end

  str
end

# Write a method that will transpose a rectangular matrix (array of arrays)
def transpose(matrix)
  result = Array.new(matrix[0].length, []) #HARD - PASS BY REFERENCE ISSUE

  matrix.each do |row|
    row.each_with_index do |el, col_idx|
      if result[col_idx] == []
        result[col_idx] = [el]
      else
        result[col_idx] << el
      end
    end
  end
  result
end


class Array
  def my_inject(accumulator = nil, &block)
    i = 0
    while i < self.length
      byebug
      if self[i + 1] != nil && accumulator == nil && i == 0
        accumulator = self[i]
        i += 1
      end
      accumulator = block.call(accumulator, self[i])
      i += 1
    end
    accumulator
  end
end
