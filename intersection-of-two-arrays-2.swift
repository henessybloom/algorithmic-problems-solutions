import Foundation

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count > nums2.count {
            return intersect(nums2, nums1)
        }

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
