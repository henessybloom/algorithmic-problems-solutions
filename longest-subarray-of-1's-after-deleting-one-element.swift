//Key Idea: Maintaining a window with at most one zero by tracking consecutive ones before and after the zero.

class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        var ans = 0
        var zerosCnt = 0
        var leftSum = 0
        var rightSum = 0

        for i in 0..<nums.count {
            if nums[i] == 1 {
                if zerosCnt == 0 {
                    leftSum += 1
                }

                if zerosCnt == 1 {
                    rightSum += 1
                }
            }

            if nums[i] == 0 {
                zerosCnt += 1

                if zerosCnt == 2 {
                    ans = max(ans, leftSum + rightSum)
                    leftSum = rightSum
                    rightSum = 0
                    zerosCnt = 1
                }
            }
        }

        ans = max(ans, leftSum + rightSum)

        return zerosCnt == 0 ? nums.count - 1 : ans
    }
}
