// General Idea : Iterate through nums and every time we see a zero, we count ones on the left and right of it. If we never see a zero, return 'nums.count - 1'
class Solution {
    private func countAdjacentOnes(_ idx: Int, _ nums: [Int]) -> Int {
        var left = idx - 1
        var right = idx + 1
        var onesOnTheLeft = 0
        var onesOnTheRight = 0

        while left >= 0, nums[left] != 0 {
            onesOnTheLeft += 1
            left -= 1
        }
        
        while right < nums.count, nums[right] != 0 {
            onesOnTheRight += 1
            right += 1
        }

        return onesOnTheLeft + onesOnTheRight
    }

    func longestSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }

        var allOnes = true
        var idx = 0
        var result = 0

        while idx < nums.count {
            if nums[idx] == 0 {
                allOnes = false
                result = max(countAdjacentOnes(idx, nums), result)
            }

            idx += 1
        }

        return allOnes ? nums.count - 1 : result
    }
}
