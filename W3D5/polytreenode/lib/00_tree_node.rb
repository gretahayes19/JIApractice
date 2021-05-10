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

    def add_child(child)
        child.parent = self 
    end
    
    def remove_child(child)
        if child && !self.children.include?(child)
            raise "Tried to remove node that isn't a child"
        end
        child.parent = nil
    end

    def dfs(target)
        return self if target == self.value

        self.children.each do |child|
            sub_result = child.dfs(target)
            return sub_result unless sub_result == nil
        end

        nil
    end

    def bfs(target)
        queue = [self]

        until queue.empty? 
            curr = queue.shift 
            
        end

    end

end