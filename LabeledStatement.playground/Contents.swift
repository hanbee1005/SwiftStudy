import UIKit

/*
 # Labeled Statement
 */

// Label(라벨명): statement(문장)
// break Label(라벨명)
// continue Label(라벨명)
// 동일한 label 을 가진 문장을 제어함으로써 원하는 문장을 직접 제어할 때 사용함

for i in 1...3 {
    print("OUTER LOOP", i)
    
    for j in 1...3 {
        print("    inneer loop", j)
        
        break
    }
}

outer: for i in 1...3 {
    print("OUTER LOOP", i)
    
    for j in 1...3 {
        print("    inneer loop", j)
        
        break outer
    }
}

