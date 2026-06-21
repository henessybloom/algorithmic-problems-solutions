// Key Idea: Maintain a reference to the head node throughout the travel to the last node. As soon as the last node is hit, compare it's value with the reference, and move the reference forward. It will check for palindrome one extra time, since recursion stack has to be emptied and that will keep moving the reference forward, but there is nothing we can do
/*
 .........................................
 .....              .....              ...
 ....   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ..
 ...   █ THERE IS NOTHING █  ..
 ..    █    WE CAN DO     █  ..
 .....  ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀  ...
 .........................................
               ¯\_(ツ)_/¯
 .........................................
*/

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
    private func run(_ node: ListNode?, _ current: inout ListNode?) -> Bool {
        defer {
            if let next = current?.next {
                current = next
            }
        }

        guard let next = node?.next else {
            return node?.val == current?.val
        }

        return run(next, &current) && current?.val == node?.val
    }

    func isPalindrome(_ head: ListNode?) -> Bool {
        var current = head
        return run(head, &current)
    }
}
