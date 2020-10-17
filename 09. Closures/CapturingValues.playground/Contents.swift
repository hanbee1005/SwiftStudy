import UIKit

/*
 # Capturing Values
 : 클로저에서 값을 캡처하는 방식
 */

var num = 0
let c = { print("check point #1: \(num)") }
// 이때, num 은 클로저 외부의 값으로
// 클로저는 클로저 외부의 값을 내부에서 사용할 때 값을 캡처
c()

num += 1
print("check point #2: \(num)")

// 값을 캡처하는 방식
// 1. 값을 복사 (Objective-C)
// 2. 값을 참조 (Swift)
// 따라서 스위프트 클로저에서 캡처한 값을 변경하면
// 원래 값도 변경이 됨

let cv = {
    num += 1
    print("check point #3: \(num)")
}
cv()

print("check point #4: \(num)")
