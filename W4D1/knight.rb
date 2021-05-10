require_relative '00_tree_node'

class KnightPathFinder

    MOVES = [
        [-2, -1],
        [-2,  1],
        [-1, -2],
        [-1,  2],
        [ 1, -2],
        [ 1,  2],
        [ 2, -1],
        [ 2,  1]
    ] 
    def self.valid_move(pos)
        valid_moves = []
        posx, posy = pos
        MOVES.each do |(dx, dy)| 
            new_move = [dx + posx, dy + posy]
            valid_move << new_move if new_move.all? { |coord| coord.between?(0, 7) }
        end

        valid_moves
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [start_pos]
        @root_node = PolyTreeNode.new(start_pos)

        build_move_tree
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos)
            .reject { |new_pos| considered_positions.include?(new_pos) }
        @considered_positions += new_moves
        new_moves
    end

    def build_move_tree
        nodes = [self.root_node]

        until nodes.empty?
            current_node = nodes.shift

            current_pos = current_node.value
            new_move_positions(current_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_node)
                nodes << next_node
            end
        end
    end

    def find_path(end_pos)
        node = self.root_node.dfs(end_pos)
    end

    
    
end

kpf = KnightPathFinder.new([0,0])

