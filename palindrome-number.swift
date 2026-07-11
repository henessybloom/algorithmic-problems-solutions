// Key Idea: Convert x into an array, and perform the usual palindrome checking algorithm with two pointers. If x is a negative number, return false, for negative numbers cannot be palindromes.

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        let arr = Array(String(x))
        var left = 0
        var right = arr.count - 1
        while left <= right {
            if arr[left] != arr[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}
