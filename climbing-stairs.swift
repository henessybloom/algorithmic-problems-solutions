// Solution1: recursive(dynamic programming)
// Key idea: On each step, we compute and add up two possible ways : if we go one step forward or if we go two steps forward. If current step equals n, then we finished climbing and we can return 1(as if 1 distinct way has been calculated). if we go past n, then we return zero, because it means the current way is invalid(because we stepped over n)
class Solution {
    var memo: [Int: Int] = [:]
    func climbStairs(_ n: Int) -> Int {
        sol(n)
    }

    func sol(_ n: Int) -> Int {
        func run(_ idx: Int) -> Int {
            if idx == n { return 1 }
            if idx > n { return 0 }
            if let result = memo[idx] { return result }
            let result = run(idx + 1) + run(idx + 2)
            memo[idx] = result
            return result
        }
        return run(0)
    }
}

// Solution 2: iterative(dynamic programming)
// Key Idea: we create an array, each element of which represents the count of all possible ways to reach n steps. we know, that it takes 0 steps to reach 0, 1 step to reach 1 and 2 steps to reach 2. to calculate the number of steps for each following n, we can use the formula dp[i - 1] + dp[i - 2]
class Solution {
    func climbStairs(_ n: Int) -> Int {
        sol(n)
    }

    func sol(_ n: Int) -> Int {
        if n <= 2 { return n }
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        dp[2] = 2
        for i in 3...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
}
