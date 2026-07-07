// Solution 1 :
// Key Idea: Knowing that strs[i] consists of only lowercase english letters. We can group strings in strs by characters' frequencies in a hash table, using ascii value of each character.
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var table = [[Int]: [String]]()
        for string in strs {
            var count = Array(repeating: 0, count: 26)
            for char in string {
                count[Int(char.asciiValue! - Character("a").asciiValue!)] += 1
            }
            table[count, default: []].append(string)
        }
        return Array(table.values)
    }
}

// Solution 2 :
// Key Idea : Two strings are anagrams, if sorting them results in the same string. Utilizing that property, we can group strings in str, using their sorted versions as keys in a hash table.
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var table: [[Character]: [String]] = [:]
        
        for string in strs {
            let sorted = string.sorted()
            if let _ = table[sorted] {
                table[sorted]!.append(string)
            } else {
                table[sorted] = [string]
            }
        }
        
        return Array(table.values)
    }
}
