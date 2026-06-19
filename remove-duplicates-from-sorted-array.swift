// Key Idea: Use two pointers, one to travel through array, the other one to keep track of the index, which will be used to place the next element. Maintain the last seen element and count how many unique elements there are in the array.

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return 1
        }

        var i = 1
        var j = 1
        var lastSeen = nums[0]
        var ans = 1

        while i < nums.count {
            if nums[i] != lastSeen {
                nums[j] = nums[i]
                lastSeen = nums[i]
                j += 1
                ans += 1
            }

            i += 1
        }

        return ans
    }
}
