/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

// Key Idea: Reverse a list node by node, maintaining references to current and previous nodes
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var previous: ListNode? = nil
        var current = head

        while let _ = current {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        return previous
    }
}
