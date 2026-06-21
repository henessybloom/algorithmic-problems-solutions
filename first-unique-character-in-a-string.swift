// Key Idea: Maintain two hash tables, dictionary and a set. Dictionary for keeping all the characters, that appears only onces to choose the one with the smallest index, and set of duplicates, to keep track of duplicates and avoid readding them into the dictionary.

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var str = Array(s)
        var indicesTable: [Character: Int] = [:]
        var duplicates: Set<Character> = []
        var i = 0

        while i < str.count {
            let char = str[i]

            if let _ = indicesTable[char] {
                indicesTable[char] = nil
                duplicates.insert(char)
            } else {
                if !duplicates.contains(char) {
                    indicesTable[char] = i
                }
            }

            i += 1
        }
        
        return indicesTable.values.sorted { $0 < $1 }.first ?? -1
    }
}
