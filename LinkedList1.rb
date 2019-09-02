class LinkedListNode
    attr_accessor :value, :next_node
    
    def initialize(value, next_node=nil)
        @value = value
        @next_node = next_node
    end
end

class Stack
    attr_reader :data
    
    def initialize
        @data = nil
    end
    
    #Push a value onto the stack
    def push(value)
        #nodeValue = value
        @data = LinkedListNode.new(value, @data)
    end
    
    #Pop an item off the stack
    #Remove the last item that was pushed onto the 
    #stack and return the value to the user
    def pop
        if @data.nil?
            popValue = "nil"
            #popValue = nil 
        else
            popValue = @data.value
            if @data.next_node.nil?
                #effectively returning the stack to its initial state
                @data = nil
            else
                @data = @data.next_node     
            end                    
        end
        return popValue
    end
end

def print_values(list_node)
    if list_node
        print "#{list_node.value} --> "
        print_values(list_node.next_node)
    else
        print "nil\n"
        return
    end
end

def simple_reverse_list(list)
    @currentNode = nil
    while list
        @currentNode = LinkedListNode.new(list.value, @currentNode)
        list = list.next_node
    end
    return @currentNode
end

def reverse_list(list)
    # Make a stack of nodes
    newStack = Stack.new
    while list
        newStack.push(list.value)
        list = list.next_node
    end
    
    # Reverse the first stack
    secondStack = Stack.new
    nilTest = 0
    while nilTest < 1
        popValue = newStack.pop
        if popValue == "nil"
            nilTest = 1
        else
            secondStack.push(popValue)
        end
    end
    
    # Set up new linked list using stack
    @node = nil
    nilTest = 0
    while nilTest < 1
        popValue = secondStack.pop
        if popValue == "nil"
            nilTest = 1
        else
            @node = LinkedListNode.new(popValue, @node)
        end
    end
    return @node
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

#print_values(node3)

revlist = reverse_list(node3) 
#revlist = simple_reverse_list(node3)
print_values(revlist)