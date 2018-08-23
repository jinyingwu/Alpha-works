class Board
  attr_reader :grid

  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  def initialize(grid = self.class.default_grid, random = false)
    @grid = grid
    randomize if random
  end

  def full?
    grid.flatten.none?(&:nil?)
  end

  def in_range?(position)
    position.all? { |x| x.between?(0, grid.length - 1) }
  end

  def place_random_ship
    raise "hell" if full?
    position = random_pos

    until empty?(position)
      position = random_pos
    end

    self[position] = :s
  end

  def randomize(count = 10)
    count.times { place_random_ship }
  end

  def random_pos
    [rand(size), rand(size)]
  end

  def size
    grid.length
  end

  def won?
    grid.flatten.none? { |el| el == :s }
  end

  def count
    grid.flatten.select { |el| el == :s }.length
  end

  def empty?(position = nil)
    if position
      self[position].nil?
    else
      count == 0
    end
  end

  def [](position)
    row, col = position
    grid[row][col]
  end

  def []=(position, val)
    row, col = position
    grid[row][col] = val
  end
end
