// Solution 1(dp recursive)
// Key idea: treat matrix like a plane coordinate system. using recursion and memoization, at each step move either x or y points. if x goes past n - 1 or y goes past m - 1, that means, the path is invalid, so we return zero. if we get to the state where x equals n - 1 and y equals m - 1, then we reached our destination and the path can be considered valid, so we return 1(as if 1 distinct valid path)

struct CacheKey: Hashable {
    let x: Int
    let y: Int
}
class Solution {
    var memo: [CacheKey: Int] = [:]
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        sol(m, n)
    }

    func sol(_ m: Int, _ n: Int) -> Int {
        func run(_ x: Int, _ y: Int) -> Int {
            let key = CacheKey(x: x, y: y)
            if let result = memo[key] { return result }
            if y >= m || x >= n { return 0 }
            if y == m - 1 && x == n - 1 { return 1 }
            let result = run(x + 1, y) + run(x, y + 1)
            memo[key] = result
            return result
        }
        return run(0, 0)
    }
}

// Solution 2(dp iterative)
// Key idea: the number of ways to reach any cell [i][j] = ways to reach the cell above it [i-1][j] + ways to reach the cell to its left [i][j-1]. Because those are the only two directions you can come from.
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(
            repeating: Array(repeating: 0, count: n),
            count: m
        )
        dp[0][0] = 1
        for i in 1..<m {
            dp[i][0] = dp[i - 1][0]
        }
        for j in 1..<n {
            dp[0][j] = dp[0][j - 1]
        }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[m - 1][n - 1]
    }
}
