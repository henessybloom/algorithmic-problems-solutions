// Key Idea: Create a prefix sum array to achieve O(1) computations on each sumRange call

class NumArray {
    private var prefixSum: [Int]

    init(_ nums: [Int]) {
        prefixSum = Array(repeating: 0, count: nums.count)
        prefixSum[0] = !nums.isEmpty ? nums[0] : 0
        var i = 1
        while i <= nums.count - 1 {
            prefixSum[i] = prefixSum[i - 1] + nums[i]
            i += 1
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        guard left > 0 else {
            return prefixSum[right]
        }
        return prefixSum[right] - prefixSum[left - 1]
    }
}
