// Key Idea: Use two hash tables to store symbols as keys and their count as values. Then iterate through one of the hash tables' keys, and see if a certain key also exists in the other hash table. If it does, then its the intersection and we add it to resulting array as little times as possible
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count < nums2.count { return intersect(nums2, nums1) }
        var table1: [Int: Int] = [:]
        var table2: [Int: Int] = [:]
        var result = [Int]()
        for num in nums1 { table1[num, default: 0] += 1 }
        for num in nums2 { table2[num, default: 0] += 1 }
        for (key, value) in table2 {
            if let cnt = table1[key] {
                result.append(contentsOf: Array(repeating: key, count: min(value, cnt)))
            }
        }
        return result
    }
}
