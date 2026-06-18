// Key Idea: Iterate through stones array and check if the symbol exists in jewels array. Convert jewels into set to speed up the look up operations

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let jewelsSet = Set(jewels)
        return stones.filter { jewelsSet.contains($0) }.count
    }
}
