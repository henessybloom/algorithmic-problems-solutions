// Key Idea: Merging two sorted arrays in-place using reverse two pointers to avoid overwriting unprocessed elements.

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

        // last index of nums1
        var last = m + n - 1
        var i = m - 1
        var j = n - 1

        // merge nums1 and nums2 in reverse order
        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[last] = nums1[i]
                i -= 1
            } else {
                nums1[last] = nums2[j]
                j -= 1
            }

            last -= 1
        }
        
        // fill nums1 with leftovers
        while j >= 0 {
            nums1[last] = nums2[j]
            j -= 1
            last -= 1
        }
    }
}
