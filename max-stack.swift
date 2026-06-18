// Key Idea: Maintain a separate stack of max elements

class MaxStack<T: Comparable> {
    private var array: [T] = []
    private var maxStack: [T] = []
    
    var peekMax: T? {
        maxStack.last
    }
    
    var peek: T? {
        array.last
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    func push(_ element: T) {
        array.append(element)
        
        if let currentMax = maxStack.last {
            maxStack.append(max(element, currentMax))
        } else {
            maxStack.append(element)
        }
    }
    
    func pop() -> T? {
        maxStack.popLast()
        return array.popLast()
    }
}
