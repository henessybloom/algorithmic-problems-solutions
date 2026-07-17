// SOlution 1(dp iterative)
// Key idea: the number of ways to reach any cell [i][j] = ways to reach the cell above it [i-1][j] + ways to reach the cell to its left [i][j-1]. Because those are the only two directions you can come from. if grid[i][j] contains and obstacle, then we put 0 as the partial result, since zero ways can lead to it
class Solution {
    func uniquePathsWithObstacles(_ grid: [[Int]]) -> Int {
        guard grid[0][0] != 1 else { return 0 }
        let m = grid.count
        let n = grid[0].count
        var dp = Array(
            repeating: Array(repeating: 0, count: n),
            count: m
        )
        dp[0][0] = grid[0][0] == 0 ? 1 : 0
        for i in 1..<n {
            if grid[0][i] == 1 { break }
            dp[0][i] = 1
        }
        for i in 1..<m {
            if grid[i][0] == 1 { break }
            dp[i][0] = 1
        }
        for i in 1..<m {
            for j in 1..<n {
                if grid[i][j] == 1 {
                    dp[i][j] = 0
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        return dp[m - 1][n - 1]
    }
}

// solution 2(dp recursive)
// Key idea: treat matrix like a plane coordinate system. using recursion and memoization, at each step move either x or y points. if x goes past n - 1 or y goes past m - 1, that means, the path is invalid, so we return zero. if we get to the state where x equals n - 1 and y equals m - 1, then we reached our destination and the path can be considered valid, so we return 1(as if 1 distinct valid path). if grid[y][x] contains an obstacle, then we return 0, since zero ways can lead to it
struct CacheKey: Hashable {
    let x: Int
    let y: Int
}

class Solution {
    func uniquePathsWithObstacles(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        return sol(grid, m, n)
    }

    func sol(_ grid: [[Int]], _ m: Int, _ n: Int) -> Int {
        var memo: [CacheKey: Int] = [:]
        func run(_ x: Int, _ y: Int) -> Int {
            let key = CacheKey(x: x, y: y)
            if let result = memo[key] { return result }
            if x >= n || y >= m { return 0 }
            if grid[y][x] == 1 { return 0 }
            if x == n - 1 && y == m - 1 { return 1 }
            let result = run(x, y + 1) + run(x + 1, y)
            memo[key] = result
            return result
        }
        return run(0, 0)
    }
}
