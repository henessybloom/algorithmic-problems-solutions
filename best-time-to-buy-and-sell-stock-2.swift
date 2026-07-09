// Solution 1
// Key Idea: The same idea, as in the first variation of this problem, but this time, we dont stop after selling a stock and we keep moving forward with a clean state, as if we never bought anything.
struct CacheKey: Hashable {
    let idx: Int
    let taken: Bool
}

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var cache: [CacheKey: Int] = [:]
        return run(0, false, prices, &cache)
    }

    func run(
        _ idx: Int,
        _ taken: Bool,
        _ prices: [Int],
        _ cache: inout [CacheKey: Int]
    ) -> Int {
        let key = CacheKey(idx: idx, taken: taken)
        if let result = cache[key] {
            return result
        }
        if taken && idx == prices.count {
            return -Int.max / 2
        }
        if idx == prices.count {
            return 0
        }
        if taken {
            let result = max(
                run(idx + 1, true, prices, &cache),
                prices[idx] + run(idx + 1, false, prices, &cache)
            )
            cache[key] = result
            return result
        }
        let result = max(
            run(idx + 1, false, prices, &cache),
            -prices[idx] + run(idx + 1, true, prices, &cache)
        )
        cache[key] = result
        return result
    }
}


// Solution 2
// Key Idea: Start from the base case and keep track of the previous state. That way, at day idx, we are always gonna have the best answers from day idx + 1 to day n

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let inf = Int.max / 2
        let n = prices.count
        var prev = [0, -inf]
        
        for idx in stride(from: n - 1, through: 0, by: -1) {
            var current = [0, 0]
            current[0] = max(prev[0], -prices[idx] + prev[1])
            current[1] = max(prev[1], prices[idx] + prev[0])
            prev = current
        }

        return prev[0]
    }
}
