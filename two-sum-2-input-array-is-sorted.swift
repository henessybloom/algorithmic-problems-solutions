// Key Idea: Use two pointers to add elements at the front and back of the array. If the sum is bigger than target, move the right pointer backward. If the sum is less than target, move the left pointer forward. If the sum equals, format the resulting array according to problem's description and return it

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var i = 0
        var j = numbers.count - 1
        var ans = Array<Int>()

        while i < j {
            let candidate = numbers[i] + numbers[j]

            if candidate > target {
                j -= 1
            } else if candidate < target {
                i += 1
            } else {
                ans = [i + 1, j + 1].sorted()
                break
            }
        }

        return ans
    }
}
