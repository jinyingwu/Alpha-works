

def echo(str)
  str
end


def shout(str)
  str.upcase
end

def repeat(str1, num = 2)
  result = str1
  num -= 1
  num.times do
    result += " " + str1
  end
  result
end


def start_of_word(str, n)
  str[0...n]
end

def first_word(str)
  str.split(" ")[0]
end

LITTLE_WORDS = ["over", "and", "the"]

def titleize(str)
  words = str.split(" ")

  result = words.map.each_with_index do |word, index|
    if index != 0 && LITTLE_WORDS.include?(word)
      word
    else
      word.capitalize
    end
  end
  result.join(" ")
end
