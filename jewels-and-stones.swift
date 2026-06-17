class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let jewelsSet = Set(jewels)
        return stones.filter { jewelsSet.contains($0) }.count
    }
}
