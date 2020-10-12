import UIKit

/*
 # continue
 */

// 반복문에서만 사용됨
for index in 1 ... 10 {
    
    if index % 2 == 0 {
        // 1. 현재 실행중인 반복을 중지하고 다음 반복으로 이동함
        continue
    }
    
    print(index)
}

for i in 1 ... 10 {
    print("OUTER LOOP", i)
    
    for j in 1...10 {
        if j % 2 == 0 {
            // 2. 가장 인접한 문장에 영향을 준다
            continue
        }
        
        print("    inner loop", j)
    }
}
