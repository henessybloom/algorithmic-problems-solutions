struct CacheKey: Hashable {
    let idx: Int
    let taken: Bool
}

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        let inf = -Int.max / 2
        var cache: [CacheKey: Int] = [:]
        func run(
            _ idx: Int,
            _ taken: Bool
        ) -> Int {
            let key = CacheKey(idx: idx, taken: taken)
            if let result = cache[key] { return result }
            if taken && idx >= n { return inf }
            if idx >= n { return 0 }
            if taken {
                let result = max(
                    run(idx + 1, true),
                    prices[idx] + run(idx + 2, false)
                )
                cache[key] = result
                return result
            }
            let result = max(
                run(idx + 1, false),
                -prices[idx] + run(idx + 1, true)
            )
            cache[key] = result
            return result
        }
        return run(0, false)
    }
}
