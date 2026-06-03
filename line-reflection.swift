import Foundation

struct PlanePoint: Hashable {
    let x: Int
    let y: Int
}

// MARK: - Line Reflection
func isReflected(_ points: [[Int]]) -> Bool {
    var minX = Int.max
    var maxX = -Int.max
    var seen: Set<PlanePoint> = []
    
    // Находим минимальный и максимальный x, а также строим хеш-таблицу с входными точками
    for point in points {
        let x = point[0]
        let y = point[1]
        
        minX = min(minX, x)
        maxX = max(maxX, x)
        
        seen.insert(
            PlanePoint(
                x: x,
                y: y
            )
        )
    }
    
    // Находим точку отражения
    let reflectionPoint = Double(minX + maxX) / 2.0
    
    // Проверяем, что для каждой точки существует зеркальная точка
    for point in points {
        let x = point[0]
        let y = point[1]
        let mirrorX = Int(reflectionPoint - (Double(x) - reflectionPoint))
        
        if !seen.contains(PlanePoint(x: mirrorX, y: y)) {
            return false
        }
    }
    
    return true
}

