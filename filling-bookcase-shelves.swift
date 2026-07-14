// Key Idea: Dynamic programming solution. for each book we are going to check if it fits on the current shelf. if it doesnt, we are shifting it below. if it does, we're going to see, if we're gonna take less space(vertically) by putting it on this shef, or below.

struct CacheKey: Hashable {
    let idx: Int
    let height: Int
    let width: Int
}

class Solution {
    func minHeightShelves(_ books: [[Int]], _ shelfWidth: Int) -> Int {
        sol(books, shelfWidth)
    }

    func sol(
        _ nums: [[Int]],
        _ shelfWidth: Int
    ) -> Int {
        let n = nums.count
        var cache: [CacheKey: Int] = [:]
        func run(
            _ idx: Int,
            _ height: Int,
            _ width: Int
        ) -> Int {
            let key = CacheKey(idx: idx, height: height, width: width)
            if let result = cache[key] {
                return result
            }
            if idx == n {
                return height
            }
            if width + nums[idx][0] > shelfWidth {
                let result = height + run(idx + 1, nums[idx][1], nums[idx][0])
                cache[key] = result
                return result
            }
            let result = min(
                height + run(idx + 1, nums[idx][1], nums[idx][0]),
                run(idx + 1, max(height, nums[idx][1]), width + nums[idx][0])
            )
            cache[key] = result
            return result
        }
        return run(0, 0, 0)
    }
}
