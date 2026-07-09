// Key Idea: The same as in the second variation, but now we also keep track of the total number of transactions made and stop when we made two transactions. We can say, that a transaction is made, if we end up selling something.

struct CacheKey: Hashable {
    let idx: Int
    let taken: Int
    let cnt: Int
}

// when doing a memoization, if certain state is changing, its better to include it in the CacheKey, unless its the cache dictionary itself

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var cache: [CacheKey: Int] = [:]
        func run(
            _ idx: Int,
            _ taken: Int,
            _ cnt: Int
        ) -> Int {
            let key = CacheKey(idx: idx, taken: taken, cnt: cnt)
            if let result = cache[key] { return result }
            if taken != 0 && idx == prices.count { return -Int.max / 2 }
            if idx == prices.count { return 0 }
            if cnt == 2 { return 0 }
            if taken != 0 {
                let result = max(
                    run(idx + 1, 1, cnt),
                    prices[idx] + run(idx + 1, 0, cnt + 1)
                )
                cache[key] = result
                return result
            }
            let result = max(
                run(idx + 1, 0, cnt),
                -prices[idx] + run(idx + 1, 1, cnt)
            )
            cache[key] = result
            return result
        }
        return run(0, 0, 0)
    }
}
