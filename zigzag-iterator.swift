//Key Idea: Use two alternating queues so each `next()` pulls a vector from one queue, takes its current element, and re-queues it into the other — naturally interleaving values across all input vectors.

protocol Queue {
    associatedtype Element
    func dequeue() -> Element?
    func enqueue(_ element: Element)
    var peek: Element? { get }
    var isEmpty: Bool { get }
}

class QueueArray<Element>: Queue {
    private var elements: [Element] = []
    
    func dequeue() -> Element? {
        elements.isEmpty ? nil : elements.removeFirst()
    }
    
    func enqueue(_ element: Element) {
        elements.append(element)
    }
    
    var peek: Element? {
        elements.first
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
}

class ZigzagIterator {
    private enum State {
        case first, second
    }
    
    private var idx = 0
    private var queueState: State = .first
    private var firstQueue = QueueArray<Array<Int>>()
    private var secondQueue = QueueArray<Array<Int>>()
    
    init(_ vectors: [[Int]]) {
        vectors.forEach { firstQueue.enqueue($0) }
    }
    
    func next() -> Int {
        guard hasNext() else {
            print("All vectors are exhausted")
            return Int.min
        }
        
        switch queueState {
        case .first:
            while let vector = firstQueue.dequeue() {
                if idx < vector.count {
                    let element = vector[idx]
                    
                    if (idx + 1) < vector.count {
                        secondQueue.enqueue(vector)
                    }
                    
                    if firstQueue.isEmpty {
                        idx += 1
                        queueState = .second
                    }
                    
                    return element
                }
            }
            
            print("All vectors are exhausted")
            return Int.min
        case .second:
            while let vector = secondQueue.dequeue() {
                if idx < vector.count {
                    let element = vector[idx]
                    
                    if (idx + 1) < vector.count {
                        firstQueue.enqueue(vector)
                    }
                    
                    if secondQueue.isEmpty {
                        idx += 1
                        queueState = .first
                    }
                    
                    return element
                }
            }
            
            print("All vectors are exhausted")
            return Int.min
        }
    }
    
    func hasNext() -> Bool {
        !(firstQueue.isEmpty && secondQueue.isEmpty)
    }
}
