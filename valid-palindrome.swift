//Key Idea: Strip the string down to lowercase alphanumeric characters, then use two pointers moving inward from both ends, comparing them step by step.

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let str = Array(
            s
            .lowercased()
            .filter { $0.isLetter || $0.isNumber }
        )

        guard !str.isEmpty else {
            return true
        }
        
        var i = 0
        var j = str.count - 1
        
        while i < j {
            if str[i] != str[j] {
                return false
            }
            
            i += 1
            j -= 1
        }
        
        return true
    }
}
