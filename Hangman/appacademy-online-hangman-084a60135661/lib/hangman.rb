require "byebug"
class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @board = []
  end

  def setup
    length = @referee.pick_secret_word
    @guesser.register_secret_length(length)
    @board = Array.new(length)
  end

  def take_turn
    guess = @guesser.guess(@board)
    indices = @referee.check_guess(guess)
    update_board(indices, guess)
    @guesser.handle_response(guess, indices)
  end

  def update_board(index_arg, guess_arg)
    index_arg.each do |i|
      @board[i] = guess_arg
    end
  end

  def play
    setup
    take_turn until over?
    puts "You won! The word is #{@board.join("")}"
  end

  def over?
    @board.count(nil) == 0
  end

end




class HumanPlayer
  def initialize
    @guessed_letters = []
  end

  def register_secret_length(length)
    puts "The length of the word is #{length}"

  end

  def pick_secret_word
    #byebug
    print "Enter the length of your secret word: "
    gets.chomp.to_i
  end

  def check_guess(letter)
    puts "Computer guessed '#{letter}' "
    print "Posittion: "
    gets.chomp.split.map { |char| char.to_i - 1}
  end

  def guess(board)
    board_str = board.map do |ele|
      ele.nil? ? "_" : ele
    end.join("")
    puts "secret word: #{board_str}"
    print "Guess a letter: "
    guess = gets.chomp.downcase
    newGuess(guess)
  end

  def handle_response(guess, indices)
  end

  def newGuess(guess)
    unless @guessed_letters.include?(guess)
      @guessed_letters << guess
      return guess
    else
      puts "duplcate try #{guess}"
      p @guessed_letters

      puts "try anothre guess: "
      guess = gets.chomp.downcase
    end
  end

end

class ComputerPlayer
  def self.read_dictionary
    File.readlines('dictionary.txt').map(&:chomp)
  end

  def initialize(dictionary)
    @dictionary = dictionary
    @alphabet = ('a'..'z').to_a
  end

  def candidate_words
    @dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end

  def check_guess(letter)
    indices = []
    @secret_word.each_char.with_index do |char, i|
      if char == letter
        indices << i
      end
    end

    indices
  end

  def register_secret_length(length)
    @dictionary.select! {|word| word.length == length}
  end

  def handle_response(letter, index_arg)
    @dictionary.select! do |word|
      word_index = []
      word.chars.each_with_index do |char, idx|
        word_index << idx if char == letter
      end

      index_arg == word_index
    end
  end

  def guess(board)
    best = @alphabet.first
    best_count = 0
    @alphabet.each do |letter|
      count = @dictionary.count {|ele| ele.include? letter}
      if count > best_count
        best = letter
        best_count = count
      end
    end
    @alphabet.delete(best)
    best
  end
end

if __FILE__ == $PROGRAM_NAME
  dictionary = ComputerPlayer.read_dictionary
  players = {

    referee: HumanPlayer.new,
    guesser: ComputerPlayer.new(dictionary)
  }
  game = Hangman.new(players)
  game.play
end
