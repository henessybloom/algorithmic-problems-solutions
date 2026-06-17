//Key Idea: As you walk through the array, store each number's index in a hashmap so you can instantly check whether the complement needed to reach the target has already been seen.

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        var ans: [Int] = []
        ans.reserveCapacity(2)

        for (i, num) in nums.enumerated() {
            let diff = target - num

            if let j = map[diff] {
                ans.append(j)
                ans.append(i)
                break
            }

            map[num] = i
        }

        return ans
    }
}
