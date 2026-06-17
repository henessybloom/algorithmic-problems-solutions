//Key Idea: Keep a queue of recent timestamps and drop any that fall outside the last 3000ms window, so the queue size after each ping is the answer.

import Foundation

class RecentCounter {
    var callsQueue: [Int] = []

    init() {
        
    }
    
    func ping(_ t: Int) -> Int {
        guard !callsQueue.isEmpty else {
            callsQueue.append(t)
            return 1
        }

        let low = t - 3000
        let high = t
        var i = callsQueue.count - 1
        var ans = 1

        while i >= 0 {
            let call = callsQueue[i]
            
            if call >= low && call <= high {
                ans += 1
                i -= 1
                continue
            } else {
                callsQueue = Array(callsQueue[(i + 1)...])
                break
            }
        }
        
        callsQueue.append(t)
        
        return ans
    }
}
