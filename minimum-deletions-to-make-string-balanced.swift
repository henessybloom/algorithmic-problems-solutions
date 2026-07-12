// Solution 1(recursive)
// Key Idea: Go through each element and track two states: what current element equals to and whether we have encountered a 'b' before. Utilize memoization to avoid TLE
struct CacheKey: Hashable {
    let idx: Int
    let seen: Bool
}

class Solution {
    func minimumDeletions(_ s: String) -> Int {
        let arr = Array(s)
        return sol(arr)
    }

    func sol(_ s: [Character]) -> Int {
        let n = s.count
        var cache: [CacheKey: Int] = [:]

        func run(
            _ idx: Int,
            _ seen: Bool
        ) -> Int {
            let key = CacheKey(idx: idx, seen: seen)
            if let result = cache[key] {
                return result
            }
            if idx == n {
                return 0
            }
            if s[idx] == "a" && !seen {
                let result = run(idx + 1, false)
                cache[key] = result
                return result
            }
            if s[idx] == "a" && seen {
                let result = 1 + run(idx + 1, true)
                cache[key] = result
                return result
            }
            if s[idx] == "b" && seen {
                let result = run(idx + 1, true)
                cache[key] = result
                return result
            }
            
            let result = min(1 + run(idx + 1, false), run(idx + 1, true))
            cache[key] = result
            return result
        }

        return run(0, false)
    }
}

// Solution2(dp, iterative)
class Solution {
    func minimumDeletions(_ s: String) -> Int {
        var arr = Array(s)
        var prev = [0, 0]
        for idx in stride(from: s.count - 1, through: 0, by: -1) {
            var row = [0, 0]
            if arr[idx] == "a" {
                row[0] = prev[0]
                row[1] = 1 + prev[1]
            } else {
                row[0] = min(1 + prev[0], prev[1])
                row[1] = prev[1]
            }
            prev = row
        }
        return prev[0]
    }
}
