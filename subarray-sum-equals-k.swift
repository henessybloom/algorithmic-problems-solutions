// Key Idea: Key Idea: For each index, track the running prefix sum. If `currentSum - k` was seen before, the subarray between that earlier index and the current one sums to `k`. Use a hash map to count prefix sum occurrences in O(1), seeded with `[0: 1]` to handle subarrays starting from index 0.

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var ans = 0
        var currentSum = 0
        var table: [Int: Int] = [
            0: 1
        ]
        for num in nums {
            currentSum += num
            let diff = currentSum - k
            if let cnt = table[diff] {
                ans += cnt
            }
            table[currentSum, default: 0] += 1
        }
        return ans
    }
}
