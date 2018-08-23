require "byebug"
# Given an array of unique integers ordered from least to greatest, write a
# method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)
  first = nums[0]
  last = nums[-1]
  result = []
  (first..last).each do |ele|
    result << ele unless nums.include?(ele)
  end

  result
end

# Write a method that returns the nth prime number
def nth_prime(n)
  i = 0
  num = 1
  if n == 0
    return nil
  end
  while i < n
    num += 1
    i += 1 if is_prime?(num)

  end
  num
end

def is_prime?(num)
  if num < 2
    return false
  end

  i = 2
  while i < num
    if num % i == 0
      return false
    end
    i += 1
  end

  true
end

class Hash
  # Hash#select passes each key-value pair of a hash to the block (the proc
  # accepts two arguments: a key and a value). Key-value pairs that return true
  # when passed to the block are added to a new hash. Key-value pairs that return
  # false are not. Hash#select then returns the new hash.
  #
  # Write your own Hash#select method by monkey patching the Hash class. Your
  # Hash#my_select method should have the functionailty of Hash#select described
  # above. Do not use Hash#select in your method.

  def my_select(&prc)
      arr = []
      prc.call(self.each {|k, v| arr << [k, v]})
      arr
  end
end

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the length of the longest palindrome in
# a given string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)
  longest = ''
  i = 0
  while i < string.length
    j = 1
    while (i + j) <= string.length
      x = string.slice(i, j)
      if (x == x.reverse) && (x.length > longest.length)
        longest = x
      end
      j += 1
    end
    i += 1
  end
  if longest.length == 1
    return false
  end
  longest.length

end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    self.each do |ele|
      prc.call(ele)
    end
  end
end

class Array
  # Write an Array method that returns a bubble-sorted copy of an array.
  # Do NOT call the built-in Array#sort method in your implementation.
  def bubble_sort(&prc)
    arr = []
    self.each do |ele|
      arr << ele
    end
    return arr if arr.size <= 1 # already sorted
    swapped = true
    while swapped do
      swapped = false
      0.upto(arr.size-2) do |i|
        if arr[i] > arr[i+1]
          arr[i], arr[i+1] = arr[i+1], arr[i] # swap values
          swapped = true
        end
      end
    end

    arr
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)

  end
end

# The following is a skeleton of three classes you will be asked to define to
# pass the related specs. Please read the specs carefully to determine the
# functionality and instance variables you should give each class. Show us your
# object-oriented programming skills!

class Cat
  attr_reader :name

  def initialize(name)
    @name = name

  end

  def meow
    'meow'
  end

  def receive_love
    meow
  end

end

class Dog
  attr_accessor :name, :breed
  BREEDS = ['Husky', 'Black Labrador', 'German Shepherd', 'Chihuahua']

  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def play_with(cat)
  end

  def make_a_pup
    pup = new.Dog("good boy", "woo")
    pup
  end

end

class Human
  attr_reader :name

  def initialize(name)
    @name = name

  end
end
