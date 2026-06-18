// Key Idea: Use Gauss' formula to find the sum of all element up to n. The find the sum of all elements in input array. The complement is the missing number

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
