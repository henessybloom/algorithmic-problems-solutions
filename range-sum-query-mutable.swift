// Key Idea: Use a Segment Tree to achieve logarithmic time complexity for range sum queries and updates. In this solution, the input array `nums` isnt stored,but it can be, if necessary.

class NumArray {
    private var tree: [Int]
    private var n: Int

    init(_ nums: [Int]) {
        n = nums.count
        tree = Array(repeating: 0, count: nums.count * 4)
        build(nums, 0, 0, n - 1)
    }
    
    func update(_ index: Int, _ val: Int) {
        update(0, 0, n - 1, index, val)
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        sum(0, 0, n - 1, left, right)
    }

    private func update(_ node: Int, _ start: Int, _ end: Int, _ index: Int, _ value: Int) {
        if start == end {
            tree[node] = value
            return
        }
        let middle = start + (end - start) / 2
        if index <= middle {
            update(node * 2 + 1, start, middle, index, value)
        } else {
            update(node * 2 + 2, middle + 1, end, index, value)
        }
        tree[node] = tree[node * 2 + 1] + tree[node * 2 + 2]
    }

    private func sum(
        _ node: Int,
        _ treeLeft: Int,
        _ treeRight: Int,
        _ queryLeft: Int,
        _ queryRight: Int
    ) -> Int {
        if queryLeft > queryRight {
            return 0
        }
        if queryLeft == treeLeft && queryRight == treeRight {
            return tree[node]
        }
        let middle = treeLeft + (treeRight - treeLeft) / 2
        return sum(
            node * 2 + 1,
            treeLeft,
            middle,
            queryLeft,
            min(queryRight, middle)
        ) + sum(
            node * 2 + 2,
            middle + 1,
            treeRight,
            max(middle + 1, queryLeft),
            queryRight
        )
    }

    private func build(
        _ nums: [Int],
        _ node: Int,
        _ start: Int,
        _ end: Int
    ) {
        if start == end {
            tree[node] = nums[start]
            return
        }
        let middle = start + (end - start) / 2
        build(nums, node * 2 + 1, start, middle)
        build(nums, node * 2 + 2, middle + 1, end)
        tree[node] = tree[node * 2 + 1] + tree[node * 2 + 2]
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * obj.update(index, val)
 * let ret_2: Int = obj.sumRange(left, right)
 */
