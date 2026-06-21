// Key Idea: Maintain two references, one slow and one fast, fast moves two times, while slow moves one time. When fast hits the end, slow will be at the middle

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
class Solution {
    private func run(_ fast: inout ListNode?, _ slow: inout ListNode?) -> ListNode? {
        guard let _ = fast, let next = fast?.next else {
            return slow
        }

        fast = fast?.next?.next
        slow = slow?.next

        return run(&fast, &slow)
    }

    func middleNode(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        return run(&fast, &slow)
    }
}
