//Key Idea: Walk through the string counting the current run of identical characters, resetting the counter whenever the character changes, and keep the largest run seen.

class Solution {
    func maxPower(_ s: String) -> Int {
        guard s.count > 1 else {
            return 1
        }

        var lastSymbol = s[s.startIndex]
        var ans = 0
        var count = 0
        var i = s.startIndex

        while i < s.endIndex {
            if s[i] == lastSymbol {
                count += 1
            } else {
                ans = max(ans, count)
                lastSymbol = s[i]
                count = 1
            }

            i = s.index(after: i)
        }

        ans = max(ans, count)

        return ans
    }
}
