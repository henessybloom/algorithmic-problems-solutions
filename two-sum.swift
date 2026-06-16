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
