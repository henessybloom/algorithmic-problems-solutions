
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var j = 0
        var i = 0

        while i < nums.count {
            if nums[i] != 0 {
                nums.swapAt(i, j)
                j += 1
            }

            i += 1
        }
    }
}
