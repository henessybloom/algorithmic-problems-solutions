//Key Idea: A tree is symmetric when its left and right subtrees mirror each other, so recursively compare the outer pair (left.left vs right.right) and inner pair (left.right vs right.left).
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
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root?.left == nil && root?.right == nil { return true }
        if root?.left == nil || root?.right == nil { return false }
        return run(root?.left, root?.right)
    }

    func run(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil { return true }
        if left == nil || right == nil { return false }
        if left?.val != right?.val { return false }
        return run(left?.left, right?.right) && run(left?.right, right?.left)
    }
}
