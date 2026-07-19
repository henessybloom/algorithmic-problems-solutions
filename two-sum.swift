//Key Idea: As you walk through the array, store each number's index in a hashmap so you can instantly check whether the complement needed to reach the target has already been seen.
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var table: [Int: Int] = [:]
        var ans = [Int]()
        for i in 0..<nums.count {
            var complement = target - nums[i]
            if let j = table[complement] {
                ans = [i, j]
                break
            }
            table[nums[i]] = i
        }
        return ans
    }
}
