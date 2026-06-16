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
