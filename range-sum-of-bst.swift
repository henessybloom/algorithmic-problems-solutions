/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

// Key Idea: Start a regular recursive pre-order search, but exploit properties of BST and prune unnecessary calls
class Solution {
    private func travel(
        _ node: TreeNode?,
        _ low: Int,
        _ high: Int,
        _ sum: inout Int
        ) {
            guard let node else {
                return
            }

            if node.val >= low && node.val <= high {
                sum += node.val
            }

            if node.val < low {
                travel(node.right, low, high, &sum)
            } else if node.val > high {
                travel(node.left, low, high, &sum)
            } else {
                travel(node.left, low, high, &sum)
                travel(node.right, low, high, &sum)
            }
    }

    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var sum = 0
        travel(root, low, high, &sum)

        return sum
    }
}
