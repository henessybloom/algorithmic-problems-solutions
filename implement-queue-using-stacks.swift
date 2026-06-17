// Key Idea : Implement a queue, using double stack implementation. When element is enqueued, append it to the right stack. When element is dequeued, reverse the right stack, assign it to the left stack and return last element of the left stack.

class MyQueue {

    var rightStack: [Int] = []
    var leftStack: [Int] = []

    init() {}
    
    func push(_ x: Int) {
        rightStack.append(x)
    }
    
    func pop() -> Int {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }

        return leftStack.popLast()!
    }
    
    func peek() -> Int {
        !leftStack.isEmpty ? leftStack.last! : rightStack.first!
    }
    
    func empty() -> Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
