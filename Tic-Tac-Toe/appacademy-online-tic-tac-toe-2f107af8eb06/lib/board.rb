class Board
  attr_reader :grid

  def initialize(input = nil)
    @grid = Array.new(3) { Array.new(3) }
    if input != nil
      @grid = input
    end
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end

  def empty?(pos)
    self[pos] == nil
  end

  def winner
    i = 0
    while i < 3
      mark = self[[i, 0]]
      if mark != nil
        if mark == self[[i, 1]] && mark == self[[i, 2]]
          return mark
        end
      end
      i += 1
    end

    i = 0
    while i < 3
      mark = self[[0, i]]
      if mark != nil
        if mark == self[[1, i]] && mark == self[[2, i]]
          return mark
        end
      end
      i += 1
    end

    mark = self[[0, 0]]
    if mark == self[[1, 1]] && mark == self[[2, 2]]
      return mark
    end

    mark = self[[0, 2]]
    if mark == self[[1, 1]] && mark == self[[2, 0]]
      return mark
    end
  end

  def over?
    if self == [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
      return false
    end
    if self.winner != nil
      return true
    else
      #byebug
      @grid.each do |ele|
        #byebug
        if ele.all? == false
          return false
        end
      end
      return true
    end

    #false
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end
end
