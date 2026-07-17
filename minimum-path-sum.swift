// Solution 1(dp recursive)
// Key Idea: at each call, check if we are within a grid, then check if we are at bottom right element, in which case return the cost of bottom right element. otherwise try to add current cost to either right cell or bottom cell, and see which gonna be smaller
struct CacheKey: Hashable {
    let x: Int
    let y: Int
}

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        return sol(grid, n, m)
    }

    func sol(_ grid: [[Int]], _ n: Int, _ m: Int) -> Int {
        var memo: [CacheKey: Int] = [:]
        let inf = Int.max / 2
        func run(_ x: Int, _ y: Int) -> Int {
            let key = CacheKey(x: x, y: y)
            if let result = memo[key] { return result }
            if x >= n || y >= m { return inf }
            if x == n - 1 && y == m - 1 { return grid[y][x] }
            let result = min(
                grid[y][x] + run(x + 1, y),
                grid[y][x] + run(x, y + 1)
            )
            memo[key] = result
            return result
        }
        return run(0, 0)
    }
}

// Solution 2(dp iterative)
// Key Idea: the cost to reach any cell [i][j] = minimum between grid[i][j] plus the cost to reach the cell above it [i-1][j] or grid[i][j] plus the cost to reach the cell to its left [i][j-1]. Because those are the only two directions you can come from.
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var dp = Array(
            repeating: Array(repeating: 0, count: n),
            count: m
        )
        dp[0][0] = grid[0][0]
        for i in 1..<n {
            dp[0][i] = dp[0][i - 1] + grid[0][i]
        }
        for i in 1..<m {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = min(
                    grid[i][j] + dp[i - 1][j],
                    grid[i][j] + dp[i][j - 1]
                )
            }
        }
        return dp[m - 1][n - 1]
    }
}
