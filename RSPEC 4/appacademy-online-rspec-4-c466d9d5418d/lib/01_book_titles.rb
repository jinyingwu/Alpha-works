class Book
  attr_accessor :title

  def initialize(book_name = nil)
    @title = book_name
  end

  def title
    arr = ["to", "a", "the", "in", "of", "and", "an"]
    cap_words = []
    @title.split.each_with_index do |word, index|
      if arr.include?(word) && index == 0
        cap_words << word.capitalize
      elsif arr.include?(word)
        cap_words << word
      else
        cap_words << word.capitalize
      end
    end
    @title = cap_words.join(" ")
  end

end
