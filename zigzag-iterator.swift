//Key Idea: Use two alternating queues so each `next()` pulls a vector from one queue, takes its current element, and re-queues it into the other. Maintain a single `i` pointer, which increments, whenever whichever queue goes empty. Only enqueue vector into another queue, if `i + 1 < vector.count` statement is valid for that vector, indicating, that vector can still produce values.
class ZigZagIterator {
    private enum State {
        case first, second
    }
    private var state: State = .first
    private var vectors: [[Int]] = []
    private var firstQueue: [[Int]] = []
    private var secondQueue: [[Int]] = []
    private var i = 0
    
    init(vectors: [[Int]] = []) {
        self.vectors = vectors
        firstQueue.reserveCapacity(vectors.count)
        secondQueue.reserveCapacity(vectors.count)
        vectors.forEach { firstQueue.append($0) }
    }
    
    var hasNext: Bool {
        !(firstQueue.isEmpty && secondQueue.isEmpty)
    }
    
    func next() -> Int? {
        guard hasNext else {
            print("All vectors are exhausted")
            return nil
        }
        var ans: Int?
        
        switch state {
        case .first:
            guard let vector = firstQueue.first else {
                return nil
            }
            firstQueue.removeFirst()
            ans = vector[i]
            if i + 1 < vector.count {
                secondQueue.append(vector)
            }
            if firstQueue.isEmpty {
                state = .second
                i += 1
            }
        case .second:
            guard let vector = secondQueue.first else {
                return nil
            }
            secondQueue.removeFirst()
            ans = vector[i]
            if i + 1 < vector.count {
                firstQueue.append(vector)
            }
            if secondQueue.isEmpty {
                state = .first
                i += 1
            }
        }
        
        return ans
    }
}
