// Key Idea: Use two pointers to track  start and end of each word. Once white space is encountered, reverse elements from the left pointer up to right pointer exclusively. Last word will always get left out of the main for-in loop, so make sure to reverse the last word after the main for-in loop

class Solution {
    func reverseWords(_ s: String) -> String {
        var string = Array(s)
        var i = 0
        
        for j in string.indices {
            if string[j] == " " {
                string[i..<j].reverse()
                i = j + 1
            }
        }

        string[i...].reverse()
        return String(string)
    }
}
