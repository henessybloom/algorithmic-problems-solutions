// Key Idea: Apply a regular column addition from arithmetic. I fucking hate String.Index

class Solution {
    private func add(
        _ num1: String,
        _ num2: String,
        _ i: String.Index?,
        _ j: String.Index?,
        _ extra: Int?
    ) -> String {
        guard i != nil || j != nil else {
            if let extra {
                return "\(extra)"
            }
            
            return ""
        }
        
        var sum = 0
        
        if let i, let j {
            // can safely force unwrap because "num1 and num2 consist of only digits."
            sum += Int(String(num1[i]))! + Int(String(num2[j]))!
        } else if let i {
            sum += Int(String(num1[i]))!
        } else if let j {
            sum += Int(String(num2[j]))!
        }
        
        if let extra {
            sum += extra
        }
        
        var nextI: String.Index?
        var nextJ: String.Index?
        
        if let i, i > num1.startIndex {
            nextI = num1.index(before: i)
        }
        
        if let j, j > num2.startIndex {
            nextJ = num2.index(before: j)
        }

        guard sum < 10 else {
            let remainder = sum % 10
            sum /= 10
            let extra = sum % 10
            return add(num1, num2, nextI, nextJ, extra) + "\(remainder)"
        }

        return add(
            num1,
            num2,
            nextI,
            nextJ,
            nil
        ) + "\(sum)"
    }

    func addStrings(_ num1: String, _ num2: String) -> String {
        guard num1.count <= num2.count else {
            return addStrings(num2, num1)
        }

        return add(
            num1,
            num2,
            num1.index(before: num1.endIndex),
            num2.index(before: num2.endIndex),
            nil
        )
    }
}
