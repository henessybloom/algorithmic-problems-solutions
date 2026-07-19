//Key Idea: Iterate through an array and maintain left and right boundaries of each consecutive subsequence. When encountering an element, which is consecutive, update the right pointer(move it forward). When encountering an element, which isnt consecutive, compress the current left and right boundaries, add compressed string to a resulting array, and update left and right pointers.
class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard !nums.isEmpty else {
            return []
        }
        var result = [String]()
        var left = nums[0]
        var right = nums[0]
        for i in 1..<nums.count {
            if nums[i - 1] + 1 == nums[i] {
                right = nums[i]
                continue
            }
            result.append(compress(left, right))
            left = nums[i]
            right = nums[i]
        }
        result.append(compress(left, right))
        return result
    }

    func compress(_ left: Int, _ right: Int) -> String {
        guard left != right else {
            return "\(left)"
        }
        return "\(left)->\(right)"
    }
}
