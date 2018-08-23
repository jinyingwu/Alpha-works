require_relative "board"
require_relative "player"

class BattleshipGame
  attr_reader :board, :player

  def initialize(player = HumanPlayer.new("jin"), board = Board.random)
    @board = board
    @player = player
    @hit = false
  end

  def attack(position)
    if board[position] == :s
      @hit = true
    else
      @hit = false
    end

    board[position] = :x
  end

  def count
    board.count
  end

  def game_over?
    board.won?
  end

  def play_turn
    position = nil

    until valid_play?(position)
      display_status
      position = player.get_play
    end

    attack(position)
  end

  def valid_play?(position)
    position.is_a?(Array) && board.in_range?(position)
  end

  def hit?
    @hit
  end

  def declare_winner
    puts "You won!"
  end

  def display_status
    #system("clear")
    board.display
    puts "It's a hit!" if hit?
    puts "There are #{count} ships remaining."
  end
end

if __FILE__ == $PROGRAM_NAME
  BattleshipGame.new.play
end
