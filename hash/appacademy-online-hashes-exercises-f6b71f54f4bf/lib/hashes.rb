# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  words = str.split
  hsh = {}

  words.each do |word|
    hsh[word] = word.length
  end
  hsh
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  arr = hash.sort_by {|k, v| v}

  arr[-1].first
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |k, v|
    older[k] = v
  end

  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  chars = word.split("")
  hsh = Hash.new(0)

  chars.each do |cha|
    hsh[cha] += 1
  end
  hsh
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  hsh = Hash.new(0)

  arr.each do |ele|
    hsh[ele] += 1
  end

  hsh.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  hsh = Hash.new(0)

  numbers.each do |num|
    if num.odd?
      hsh[:odd] += 1
    else
      hsh[:even] += 1
    end
  end
  hsh
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are
# lower case.
def most_common_vowel(string)
  vowels = %w(a e i o u)
  chars = string.chars
  hsh = Hash.new(0)

  chars.each do |ch|
    hsh[ch] += 1 if vowels.include?(ch)
  end

  result = hsh.sort_by {|k, v| v}
  result[-1].first
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  hsh = students.select {|k, v| v > 6}
  arr = []

  hsh.each_key do |k|
    arr << k
  end

  i = 0
  result = []
  while i < arr.length
    j = i + 1
    while j < arr.length
      result << [arr[i], arr[j]]
      j += 1
    end
    i += 1
  end

  result
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  hsh = Hash.new(0)

  specimens.each do |ele|
    hsh[ele] += 1
  end
  number_of_species = hsh.length
  arr = hsh.sort_by {|k, v| v}
  smallest_population_size = arr[0].last
  largest_population_size = arr[-1].last

  (number_of_species**2 * smallest_population_size) / largest_population_size
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_hsh = character_count(normal_sign)
  vandalized_hsh = character_count(vandalized_sign)

  vandalized_hsh.each do |k, v|
    if normal_hsh[k] == nil || normal_hsh[k] < v
      return false
    end
  end
  return true
end

def character_count(str)
  words = str.downcase.split
  hsh = Hash.new(0)

  words.each do |word|
    word.chars.each do |ch|
      hsh[ch] += 1
    end
  end
  hsh
end
