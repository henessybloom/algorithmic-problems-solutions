// Key Idea: Use two pointers on s and t to check if t contains s. If by the end of the while loop, the index of s(in this case - 'i') still hasnt reached s.endIndex, that means s isnt subsequence of t
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var i = s.startIndex
        var j = t.startIndex
        while i < s.endIndex && j < t.endIndex {
            i = s[i] == t[j] ? s.index(after: i) : i
            j = t.index(after: j)
        }
        return !(i < s.endIndex)
    }
}
