// KEy Idea: use dynamic programming and memoization to simplify given state until it becomes zero or one at which point the answer is known 
class Solution {
    var memo: [Int: Int] = [:]
    func fib(_ n: Int) -> Int {
        if let result = memo[n] {
            return result
        }
        if n <= 1 {
            return n
        }
        let result = fib(n - 1) + fib(n - 2)
        memo[n] = result
        return result
    }
}
