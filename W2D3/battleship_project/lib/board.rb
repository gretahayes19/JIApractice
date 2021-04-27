class Board
  def initialize(n)
    @grid = Array.new(n){Array.new(n, :N)}
    @size = n * n
  end

  def size
    @size
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def num_ships
    count = 0
    @grid.each {|row| row.each {|ele| count += 1 if ele == :S }}
    count
  end
end
