// Key Idea: Maintain two chunks of 1's, left and right and keep counting zeros. After hitting every second zero, move rightChunk to the leftChunk, set zeroCount to 1 and keep counting. At the end compare ans and sum of leftChunk and rightChunk once again to count the leftovers and return ans only if at least one zero was met. Otherwise return `nums.count - 1`

class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }

        var leftChunk = 0
        var rightChunk = 0
        var ans = 0
        var i = 0
        var zeroCount = 0
        
        while i < nums.count {
            if nums[i] == 1 {
                if zeroCount == 1 {
                    rightChunk += 1
                } else {
                    leftChunk += 1
                }
                i += 1
                continue
            }

            zeroCount += 1

            if zeroCount == 2 {
                ans = max(leftChunk + rightChunk, ans)
                leftChunk = rightChunk
                rightChunk = 0
                zeroCount = 1
            }

            i += 1
        }

        ans = max(ans, leftChunk + rightChunk)

        return zeroCount == 0 ? nums.count - 1 : ans
    }
}
