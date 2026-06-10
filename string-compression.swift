class Solution {
    private func compressed(_ char: Character?, _ count: inout Int) -> [Character] {
        guard let char else {
            return []
        }

        var ans: [Character] = []

        ans.append(char)

        if count > 1 && count < 10 {
            ans.append(Character("\(count)"))
        } else if count >= 10 {
            var digits = ""

            while count > 0 {
                let remainder = count % 10
                count /= 10
                digits += "\(remainder)"
            }

            while let last = digits.popLast() {
                ans.append(last)
            }
        }

        return ans
    }
    
    func compress(_ chars: inout [Character]) -> Int {
        var lastChar: Character?
        var currentCharCount = 0
        var writePointer = 0
        var ans = 0

        for i in 0..<chars.count {
            if let _ = lastChar {
                if chars[i] == lastChar {
                    currentCharCount += 1
                } else {
                    let compressed = compressed(lastChar, &currentCharCount)
                    lastChar = chars[i]
                    currentCharCount = 1
                    chars[writePointer..<(writePointer + compressed.count)] = compressed[0..<compressed.count]
                    writePointer += compressed.count
                }
            } else {
                lastChar = chars[i]
                currentCharCount += 1
            }

            if i == chars.count - 1 {
                let compressed = compressed(lastChar,  &currentCharCount)
                chars[writePointer..<(writePointer + compressed.count)] = compressed[0..<compressed.count]
                writePointer += compressed.count
            }
        }

        return writePointer
    }
}

