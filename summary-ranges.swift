//Key Idea: Iterate through the sorted numbers grouping consecutive values into one range, and flush the current range whenever the next number breaks the +1 sequence.

class Solution {
    func produceString(_ nums: [Int]) -> String {
        guard nums.count > 1 else {
            return "\(nums[0])"
        }

        let min = nums[0]
        let max = nums[nums.count - 1]

        return "\(min)->\(max)"
    }

    func summaryRanges(_ nums: [Int]) -> [String] {
        guard !nums.isEmpty else {
            return []
        }

        var ans: [String] = []
        var currentSet: [Int] = []

        for i in 0..<nums.count {
            let num = nums[i]
            currentSet.append(num)

            guard i + 1 < nums.count else {
                ans.append(produceString(currentSet))
                break
            }

            if nums[i + 1] != (num + 1) {
                ans.append(produceString(currentSet))
                currentSet = []
            }
        }

        return ans
    }
}
