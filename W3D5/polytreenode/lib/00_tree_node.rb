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

        if self.parent
            self.parent.children.delete(self)
        end 
        @parent = parent_node
        parent_node.children << self unless self.parent.nil?
    end


    
end