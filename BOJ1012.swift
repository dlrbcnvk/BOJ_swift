// BOJ 1012
import Foundation

let t: Int = Int(readLine()!)!

for _ in 0..<t {
    
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: 50), count: 50)
    var ans: Int = 0
    
    var temp = readLine()?.components(separatedBy: " ").map{ Int($0)! }
    let m: Int = (temp?[0])!
    let n: Int = (temp?[1])!
    let k: Int = (temp?[2])!
    
    var q = [(Int, Int)]()
    
    var x: Int
    var y: Int
    
    for _ in 0..<k {
        temp = readLine()?.components(separatedBy: " ").map{ Int($0)! }
        x = (temp?[0])!
        y = (temp?[1])!
        arr[y][x] = 1
        q.append((y, x))
    }
    
    
    while !q.isEmpty {
        let current: (Int, Int) = q.removeFirst()
        let a = current.0
        let b = current.1
        if arr[a][b] == 1 {
            visiting(a: a, b: b)
            ans += 1
        }
    }
    
    func visiting(a: Int, b: Int) {
        var subqueue = [(Int, Int)]()
        subqueue.append((a, b))
        
        while !subqueue.isEmpty {
            let current: (Int, Int) = subqueue.removeFirst()
            let a = current.0
            let b = current.1
            
            //상하좌우 탐색
            if a > 0 {
                if arr[a-1][b] == 1 {
                    arr[a-1][b] = 2
                    subqueue.append((a-1, b))
                }
            }
            if a < n - 1 {
                if arr[a+1][b] == 1 {
                    arr[a+1][b] = 2
                    subqueue.append((a+1, b))
                }
            }
            if b > 0 {
                if arr[a][b-1] == 1 {
                    arr[a][b-1] = 2
                    subqueue.append((a, b-1))
                }
            }
            if b < m - 1 {
                if arr[a][b+1] == 1 {
                    arr[a][b+1] = 2
                    subqueue.append((a, b+1))
                }
            }
        }
    }
    
    print(ans)
}
