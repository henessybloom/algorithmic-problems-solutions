//Key Idea: Push every opening bracket onto a stack and, when seeing a closing one, pop and check it matches — the string is valid only if every closer pairs up and the stack ends empty.

class Solution {
    func isValid(_ s: String) -> Bool {
        var closing = "}])"
        var stack = Array<Character>()

        for element in s {
            guard closing.contains(element) else {
                stack.append(element)
                continue
            }

            if let bracket = stack.popLast() {
                if element == "}" {
                    if bracket != "{" {
                        return false
                    }
                } else if element == "]" {
                    if bracket != "[" {
                        return false
                    }
                } else {
                    if bracket != "(" {
                        return false
                    }
                }
            } else {
                return false
            }
        }

        return stack.isEmpty
    }
}
