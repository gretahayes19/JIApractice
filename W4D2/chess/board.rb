class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}
    end

    def [](position)
        row, col = position 
        @rows[row][col]
    end

    def []=(position, value)
        row, col = position 
        @rows[row][col] = value
    end
end