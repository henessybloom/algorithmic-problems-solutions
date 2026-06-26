//Key Idea: Scan both strings together and tolerate exactly one mismatch — if lengths differ by one, skip a character in the longer string; otherwise, allow a single replacement.

class Solution {
    func oneEditDistance(_ s: String, _ t: String) -> Bool {
        guard s.count <= t.count else {
            return oneEditDistance(t, s)
        }
        let diff = abs(t.count - s.count)
        var editCnt = 0
        var i = s.startIndex
        var j = t.startIndex
        
        while i < s.endIndex && j < t.endIndex {
            if s[i] != t[j] {
                editCnt += 1
                j = t.index(after: j)
                continue
            }
            
            i = s.index(after: i)
            j = t.index(after: j)
        }
        
        return editCnt == 0 ? diff == 1 : editCnt == 1
    }
}

