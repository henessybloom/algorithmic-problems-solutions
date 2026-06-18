// Key Idea: Use two hash tables to store symbols as keys and their count as values. Then iterate through one of the hash tables' keys, and see if a certain key also exists in the other hash table. If it does, then its the intersection and we add it to resulting array as little times as possible

import Foundation

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1Table: [Int: Int] = [:]
        var nums2Table: [Int: Int] = [:]
        var ans: [Int] = []

        for num in nums1 {
            if let _ = nums1Table[num] {
                nums1Table[num]! += 1
            } else {
                nums1Table[num] = 1
            }
        }

        for num in nums2 {
            if let _ = nums2Table[num] {
                nums2Table[num]! += 1
            } else {
                nums2Table[num] = 1
            }
        }

        for key in nums1Table.keys {
            if let _ = nums2Table[key] {
                let count = min(nums1Table[key]!, nums2Table[key]!)
                ans.append(contentsOf: Array(repeating: key, count: count))
            }
        }
        
        return ans
    }
}
