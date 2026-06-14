import Foundation

class Solution {
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        if s.count > t.count {
            isOneEditDistance(t, s)
        }
        
        if s.isEmpty {
            return t.count == 1
        }
        
        if t.isEmpty {
            return s.count == 1
        }
        
        let diff = abs(t.count - s.count)
        
        if diff > 1 {
            return false
        }
        
        var cnt = 0
        var i = s.startIndex
        var j = t.startIndex
        
        while i < s.endIndex && j < t.endIndex {
            if s[i] != t[j] {
                cnt += 1
                
                if cnt > 1 {
                    return false
                }
                
                if diff == 1 {
                    j = t.index(after: j)
                    continue
                }
            }
            
            i = s.index(after: i)
            j = t.index(after: j)
        }
        
        if cnt == 0 && diff == 1 {
            return true
        }
        
        return cnt == 1
    }
}

