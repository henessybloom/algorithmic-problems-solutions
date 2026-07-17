// Solution 1(Naive)
// Key Idea: utilize nested loops to iterate through all the possible subarrays and find the one with max sum. takes n^2, hence hits TLE
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = Int.min
        for i in 0..<nums.count {
            var currentMax = Int.min
            var prefixSum = 0
            for j in i..<nums.count {
                prefixSum += nums[j]
                currentMax = max(prefixSum, currentMax)
            }
            result = max(result, currentMax)
        }
        return result
    }
}

// Solution 2(expected)
// Key Idea: Use kadane's algorithm to find the subarray with the maximum sum
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = nums[0]
        var result = nums[0]
        for num in nums[1...] {
            // either extend the previous sum array, or start a new one
            sum = max(sum + num, num)
            // update result if the current maximum subarray is greater
            result = max(result, sum)
        }
        return result
    }
}

// Solution 3(dp iterative)
// Key Idea: Use dynamic programming to store best partial results in dp array. then find the maximum element in dp array. that maximum element, will be the answer
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = Array(repeating: 0, count: n)
        dp[0] = nums[0]
        for i in 1..<n {
            dp[i] = max(dp[i - 1] + nums[i], nums[i])
        }
        return maxElement(dp)
    }

    func maxElement(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        guard nums.count > 1 else { return nums[0] }
        var result = nums[0]
        for num in nums[1...] { result = max(result, num) }
        return result
    }
}
