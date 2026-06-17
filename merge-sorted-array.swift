// Key Idea: Merging two sorted arrays in-place using reverse two pointers to avoid overwriting unprocessed elements.

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

        // write index of nums1
        var write = m + n - 1
        var i = m - 1
        var j = n - 1

        // merge nums1 and nums2 in reverse order
        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[write] = nums1[i]
                i -= 1
            } else {
                nums1[write] = nums2[j]
                j -= 1
            }

            write -= 1
        }
        
        // fill nums1 with leftovers
        while j >= 0 {
            nums1[write] = nums2[j]
            j -= 1
            write -= 1
        }
    }
}
