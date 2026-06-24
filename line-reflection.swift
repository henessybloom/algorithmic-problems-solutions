struct PlanePoint: Hashable {
    let x, y: Int
}

class Solution {
    func lineReflection(_ points: [[Int]]) -> Bool {
        var minX = Int.max / 2
        var maxX = -Int.max / 2
        var seen = Set<PlanePoint>()
        
        for point in points {
            let point = PlanePoint(x: point[0], y: point[1])
            maxX = max(maxX, point.x)
            minX = min(minX, point.x)
            seen.insert(point)
        }
        
        let sum = minX + maxX
        
        for point in points {
            let point = PlanePoint(x: sum - point[0], y: point[1])
            
            if !seen.contains(point) {
                return false
            }
        }
        
        return true
    }
}
