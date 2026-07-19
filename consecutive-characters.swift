//Key Idea: Walk through the string counting the current run of identical characters, resetting the counter whenever the character changes, and keep the largest run seen.
class Solution {
    func maxPower(_ s: String) -> Int {
        var str = Array(s)
        var last = str[0]
        var i = 1
        var ans = 1
        var cnt = 1
        while i < str.count {
            if str[i] == last {
                cnt += 1
                i += 1
                continue
            }
            last = str[i]
            ans = max(ans, cnt)
            cnt = 1
            i += 1
        }
        ans = max(ans, cnt)
        return ans
    }
}
