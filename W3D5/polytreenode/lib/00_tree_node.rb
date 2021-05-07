class PolyTreeNode

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end
    
    def value 
        @value
    end

    def parent=(parent_node)
        return if self.parent == parent_node
        @parent = parent_node
        parent_node.children << self 
    end



end