//Key Idea: Push every opening bracket onto a stack and, when seeing a closing one, pop and check it matches — the string is valid only if every closer pairs up and the stack ends empty.
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        let closing: Set<Character> = ["}", "]", ")"]
        var i = s.startIndex
        while i < s.endIndex {
            guard closing.contains(s[i]) else {
                stack.append(s[i])
                i = s.index(after: i)
                continue
            }
            guard let last = stack.popLast() else {
                return false
            }
            if last == "(" && s[i] != ")" { return false }
            if last == "{" && s[i] != "}" { return false }
            if last == "[" && s[i] != "]" { return false }
            i = s.index(after: i)
        }
        return stack.isEmpty
    }
}
