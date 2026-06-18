class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var sum = 0
        var fullSum = (nums.count * (nums.count + 1)) / 2

        for num in nums {
            sum += num
        }

        return fullSum - sum
    }
}
