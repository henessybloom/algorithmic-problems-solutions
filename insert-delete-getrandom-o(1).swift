// Key Idea: Maintain a hash map along with an array. Store elements as keys and their indices as values to achieve O(1) time on all operations. When removing, swap the element with the last element to avoid O(n) time

class RandomizedSet {
    private var nums: [Int] = []
    private var table: [Int: Int] = [:]

    init() {}
    
    func insert(_ val: Int) -> Bool {
        guard let _ = table[val] else {
            nums.append(val)
            table[val] = nums.count - 1
            return true
        }
        return false
    }
    
    func remove(_ val: Int) -> Bool {
        // Make sure the nums isnt empty and value to be removed does exist
        guard !nums.isEmpty, let index = table[val] else {
            return false
        }
        // If the element was the last element, just remove it and dont perform a swap. This also covers an edge case, in which there is only one element in the array
        guard index != nums.count - 1 else {
            nums.remove(at: index)
            table[val] = nil
            return true
        }
        // Get the last element and update it's value in the table
        let last = nums[nums.count - 1]
        table[last] = index
        // Swap the element to be removed with the last element and then remove the last element. Swap is performed to achieve average O(1) time complexity
        nums.swapAt(index, nums.count - 1)
        nums.removeLast()
        // Remove the record for removed element from the table
        table[val] = nil
        return true
    }
    
    func getRandom() -> Int {
        let i = Int.random(in: 0..<nums.count)
        return nums[i]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
