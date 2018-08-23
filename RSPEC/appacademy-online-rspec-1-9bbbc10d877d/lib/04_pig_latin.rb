

def translate(str)
  words = str.split(" ")
  result = []

  words.each do |word|
    result << translate_word(word)
  end

  result.join(" ")
end

def translate_word(word)
  vowels = %w(a e i o u A E I O U)

  if vowels.include?(word[0])
    "#{word}" + "ay"
  else 
    phoneme_end = 0
    until vowels.include?(word[phoneme_end])
      phoneme_end += 1
    end
    phoneme_end += 1 if word[phoneme_end - 1] == "q"
    "#{word[phoneme_end..-1]}#{word[0...phoneme_end]}ay"
  end
end
