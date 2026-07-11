struct CacheKey: Hashable {
    let idx: Int
    let taken: Bool
    let cnt: Int
}

class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        var cache: [CacheKey: Int] = [:]
        let n = prices.count
        let inf = Int.min / 2
        func run(
            _ idx: Int,
            _ taken: Bool,
            _ cnt: Int
        ) -> Int {
            let key = CacheKey(idx: idx, taken: taken, cnt: cnt)
            if let result = cache[key] { return result }
            if taken && idx == n { return inf }
            if idx == n { return 0 }
            if cnt == k { return 0 }
            if taken {
                let result = max(
                    run(idx + 1, true, cnt),
                    prices[idx] + run(idx + 1, false, cnt + 1)
                )
                cache[key] = result
                return result
            }
            let result = max(
                run(idx + 1, false, cnt),
                -prices[idx] + run(idx + 1, true, cnt)
            )
            cache[key] = result
            return result
        }
        return run(0, false, 0)
    }
}
