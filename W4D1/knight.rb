require_relative '00_tree_node'

class KnightPathFinder

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
    end

end

kpf = KnightPathFinder.new([0,0])

