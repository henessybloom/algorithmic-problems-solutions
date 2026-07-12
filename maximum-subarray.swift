// Solution 1(Naive approach)
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

// Solution 2(expected approach)
// Key Idea: Use kadane's algorithm to find the subarray with the maximum sum
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = nums[0]
        var maxSum = nums[0]
        for i in 1..<nums.count {
            // either extend the previous subarray, or start the new from currenet element
            maxSum = max(maxSum + nums[i], nums[i])
            // update result, if the new subarray's sum is larger
            result = max(maxSum, result)
        }
        return result
    }
}
