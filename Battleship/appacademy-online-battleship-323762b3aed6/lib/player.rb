class HumanPlayer
  def initialize(name)
    @name = name
  end

  def get_play
    gets.chomp.split(",").map { |el| Integer(el) }
  end

  def prompt
    print "Enter a target: "
  end
end
