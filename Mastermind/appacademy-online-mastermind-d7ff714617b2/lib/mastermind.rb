class Code
  attr_reader :pegs
  PEGS = {"B" => :blue, "G" => :green, "O" => :orange,
     "P" => :purple, "R" => :red, "Y" => :yellow}

     def initialize(peg)
      @pegs = peg
    end

     def self.parse(string)
       chars = string.chars.map(&:upcase)
       raise ArgumentError unless chars - PEGS.keys == []
       pegs = chars.map do |cha|
         PEGS[cha]
       end
       self.new(pegs)
     end

     def self.random
       pegs = []
       i = 0
       while i < 4
         pegs << PEGS.values.sample
         i += 1
       end
       self.new(pegs)
     end

     def exact_matches(arg)
       num_match = 0

       i = 0
       while i < 4
         if @pegs[i] == arg.pegs[i]
           num_match += 1
         end
         i += 1
       end
       num_match
     end

     def near_matches(arg)
       num_match = 0
       PEGS.values.each do |ele|
         num_match += [@pegs.count(ele), arg.pegs.count(ele)].min
       end
       num_match - exact_matches(arg)
     end

     def [](idx)
       @pegs[idx]
     end

     def ==(arg)
       return false unless arg.class == Code
       @pegs == arg.pegs
     end

     def to_s
       "[#{@pegs.join(", ")}]"
     end
end



class Game
  attr_reader :secret_code

  def initialize(code = nil)
    @secret_code = code || Code.random

  end

  def get_guess
    print 'Enter a guess: '
    Code.parse(gets.chomp)
  end

  def display_matches(code)
    puts "near: #{@secret_code.near_matches(code)}"
    puts "exact: #{@secret_code.exact_matches(code)}"
  end

  def won?(code)
    @secret_code == code
  end

  def result(code)
    if code == @secret_code
      puts "You won!"
      puts "Code is: #{@secret_code}"
    else
      puts "Out of turns!"
      puts "Code is: #{@secret_code}"
    end
  end

  def play
    turn = 0
    while turn < 10
      code = get_guess
      break if won?(code)
      display_matches(code)
      turn += 1
    end
    result(code)
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new(Code.parse(PEGS.values.sample))
  game.play
end
