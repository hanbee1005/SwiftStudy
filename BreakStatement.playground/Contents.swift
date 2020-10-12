import UIKit

/*
 # break
 */

// 반복문과 switch 문에서 사용됨

// 1. switch 문에서 사용
// : case 블록 내에서 특정 조건에 따라 switch 문을 종료
let num = 2

switch num {
case 1 ... 10:
    print("begin block")
    
    if num % 2 != 0 {
        // switch 문을 종료하고 다음 문장으로 제어 전달
        break
    }
    
    print("end block")
default:
    break
}

print("done")

// 2. 반복문에서 사용
// : break 는 문장을 중지하는데 문장이 중첩되어 있다면 가장 인접한 문장을 중지
for index in 1 ... 10 {
    print(index)
    
    if index > 1 {
        // for-in 반복문을 종료하고 다음 문장으로 제어 전달
        break
    }
}

for i in 1 ... 10 {
    print("OUTER LOOP", i)
    
    for j in 1 ... 10 {
        print("    inner loop", j)
        
        if j > 1 {
            // 가장 인접한 문장을 종료함
            break
        }
    }
}
