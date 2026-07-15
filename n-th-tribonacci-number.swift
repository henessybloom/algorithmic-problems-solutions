// Key Idea: The same as for finding a fibonacci number, but now we add up 3 preceding numbers instead of 2
class Solution {
    var memo: [Int: Int] = [:]
    func tribonacci(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }
        if n == 2 { return 1 }
        if let result = memo[n] { return result }
        let result = tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3)
        memo[n] = result
        return result
    }
}
