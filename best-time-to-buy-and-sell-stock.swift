// Iterative approach. More efficent, but unscalable. Wont be able to apply in similar problems
// Key Idea: Keep track of the current maximum profit and the minimum price the stock was bought for
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var buy = prices[0]

        for i in 1..<prices.count {
            if prices[i] - buy > maxProfit {
                maxProfit = prices[i] - buy
            }
            if prices[i] < buy, i != prices.count - 1 {
                buy = prices[i]
            }
        }

        return maxProfit
    }
}

// Dynamic Programming approach. Less efficent, but can be scaled easily to solve other similar problems. Uses memoization and recursion.
// Key Idea: Maximize profit by tracking minimum buy price and calculating potential sell profit in one pass
struct CacheKey: Hashable {
    let idx: Int
    let took: Bool
}

class Solution {
    private func run(
        _ idx: Int,
        _ took: Bool,
        _ nums: [Int],
        _ cache: inout [CacheKey: Int]
    ) -> Int {
        let key = CacheKey(idx: idx, took: took)
        if let result = cache[key] {
            return result
        }
        if idx == nums.count && took {
            cache[key] = 0
            return 0
        }
        if idx == nums.count {
            cache[key] = 0
            return 0
        }
        if took {
            let result = max(
                run(idx + 1, true, nums, &cache),
                nums[idx]
            )
            cache[key] = result
            return result
        }
        let result = max(
            run(idx + 1, false, nums, &cache),
            -nums[idx] + run(idx + 1, true, nums, &cache)
        )
        cache[key] = result
        return result
    }

    func maxProfit(_ prices: [Int]) -> Int {
        var cache: [CacheKey: Int] = [:]
        return run(0, false, prices, &cache)
    }
}
