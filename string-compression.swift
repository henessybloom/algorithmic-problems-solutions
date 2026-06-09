// Key Idea: Compressing consecutive character groups in-place using two pointers to achieve constant space complexity.

import Foundation

class Solution {
    func compressed(_ char: Character?, _ count: inout Int) -> String {
        guard let char else {
            return ""
        }
        
        var ans = String(char)
        if count > 1 && count < 10 {
            ans += "\(count)"
        } else if count >= 10 {
            var digits = ""

            while count > 0 {
                let remainder = count % 10
                count /= 10
                digits += "\(remainder)"
            }

            while let last = digits.popLast() {
                ans += String(last)
            }
        }

        return ans
    }
    
    func compress(_ chars: inout [Character]) -> Int {
        var s = ""
        var lastChar: Character?
        var currentCharCount = 0

        for i in 0..<chars.count {
            if let _ = lastChar {
                if chars[i] == lastChar {
                    currentCharCount += 1
                } else {
                    let compressed = compressed(lastChar, &currentCharCount)
                    s += compressed
                    currentCharCount = 1
                    lastChar = chars[i]
                }
            } else {
                lastChar = chars[i]
                currentCharCount += 1
            }

            if i == chars.count - 1 {
                let compressed = compressed(lastChar, &currentCharCount)
                s += compressed
            }
        }
        
        chars.insert(
            contentsOf: Array(s),
            at: 0
        )
        
        return s.count
    }
}
