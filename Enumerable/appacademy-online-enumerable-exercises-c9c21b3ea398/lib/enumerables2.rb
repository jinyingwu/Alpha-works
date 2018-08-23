require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  sum = 0
  arr.each do |num|
    sum += num
  end

  sum
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.all? {|str| str.include?(substring)}
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  result = []
  ("a".."z").each do |ch|
    result << ch if string.count(ch) > 1
  end
  result
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  words = string.split

  words.sort! {|x, y| y.length <=> x.length}

  words[0..1]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  result = []
  ("a".."z").each do |ch|
    result << ch unless string.include?(ch)
  end
  result
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  result = []
  (first_yr..last_yr).each do |ele|
    result << ele if not_repeat_year?(ele)
  end
  result
end

def not_repeat_year?(year)
  strY = year.to_s.chars

  strY.each do |ch|
    return false if strY.count(ch) > 1
  end

  return true
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  result = []

  songs[0..6].each do |name|
    result << name if no_repeats?(name, songs[0..6])
  end

  result
end

def no_repeats?(song_name, songs)
  return true unless songs.count(song_name) > 1

end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  punct = %w(. , ? !)
  chars = string.chars
  words = []
  distanc = 0
  result = ""

  punct.each do |ele|
    chars.delete(ele) if chars.include?(ele)
  end

  words = chars.join("").split

  words.each do |word|
    if word.index("c")
      if result == ""
        result = word
        distanc = c_distance(word)
      else
        if distanc > c_distance(word)
          result = word
          distanc = c_distance(word)
        end
      end
    end
  end

  result
end

def c_distance(word)
  (word.length - 1) - word.index("c")
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  result = []
  i = 0
  while i < arr.length
    nIndex = i

    while arr[i] == arr[nIndex + 1]
      nIndex += 1
    end

    if nIndex != i
      result << [i, nIndex]
      i = nIndex - 1
    end
    i += 1
  end

  result
end
