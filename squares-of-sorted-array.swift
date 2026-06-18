// Key Idea: Use two pointers at the fron and the back of input array. Move them to gradually fill in the resulting array from the back.

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var i = 0
        var j = nums.count - 1
        var ans = Array(repeating: 0, count: nums.count)
        var k = ans.count - 1

        while i <= j {
            if i > j {
                break
            }
            
            let leftSquare = nums[i] * nums[i]
            let rightSquare = nums[j] * nums[j]

            if leftSquare < rightSquare {
                ans[k] = rightSquare
                j -= 1
            } else {
                ans[k] = leftSquare
                i += 1
            }

            k -= 1
        }

        return ans
    }
}
