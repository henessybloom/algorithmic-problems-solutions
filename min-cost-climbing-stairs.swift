// Solution 1(dp recursive)
// Key idea: at each step, find the best result from either going one step up or two steps up. the transition formula is to add current cost at each step. we are considered at the top of the floor only when we are past(!) the last index, so `idx > n` is our base case. since we can either start from 0 or 1, we should find which argument produces better result by calling function with 0 and 1 and finding minimum.

class Solution {
    var memo: [Int: Int] = [:]
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        sol(cost)
    }

    func sol(_ cost: [Int]) -> Int {
        let n = cost.count - 1
        let inf = Int.max / 2
        func run(_ idx: Int) -> Int {
            if idx > n { return 0 }
            if let result = memo[idx] { return result }
            let result = min(
                cost[idx] + run(idx + 1),
                cost[idx] + run(idx + 2)
            )
            memo[idx] = result
            return result
        }
        return min(run(0), run(1))
    }
}

// Solution 2(dp iterative)
// Key Idea: Store best possible partial results at each i in `dp` array.
class Solution {
    var memo: [Int: Int] = [:]
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        sol2(cost)
    }
    
    func sol2(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = Array(repeating: 0, count: n)
        dp[0] = nums[0]
        dp[1] = nums[1]
        for i in 2..<n {
            dp[i] = min(dp[i - 1], dp[i - 2]) + nums[i]
        }
        return min(dp[n - 1], dp[n - 2])
    }
}
