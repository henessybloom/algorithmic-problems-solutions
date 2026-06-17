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

// Key Idea: Walk through both linked lists and compare values. Take smaller value and move the pointer of the list, whose value was used. At the end, check which pointer wasnt exhausted and attach it to the 'current' pointer.

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy: ListNode? = ListNode()
        var current = dummy
        var leftNode = list1
        var rightNode = list2

        while let left = leftNode, let right = rightNode {
            if left.val < right.val {
                current?.next = ListNode(left.val)
                current = current?.next
                leftNode = left.next
            } else {
                current?.next = ListNode(right.val)
                current = current?.next
                rightNode = right.next
            }
        }

        if let leftNode {
            current?.next = leftNode
        }

        if let rightNode {
            current?.next = rightNode
        }

        return dummy?.next
    }
}
