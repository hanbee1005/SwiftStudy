import UIKit

/*
 # Range Operators
 범위 연산자
 */

// Closed Range Operator
// ex) a ... b (b 가 범위에 포함됨)
//     a...
//     ...a

1 ... 10
// 10 ... 1 - 에러 발생 (오름차순 범위만 허용됨)
(1 ... 10).reversed() // 내림차순을 쓰려면 reversed() 함수 사용

12.34 ... 56.78 // 실수도 가능

var sum = 0
for num in 1 ... 10 {
    sum += num
}
sum

let list = ["A", "B", "C", "D", "E"]
list[2...] // 2번째 인덱스부터 끝까지
list[...2] // 0부터 2번째 인덱스까지
// 고정된 범위가 확실한 경우에만 upperBound 생략!

// Half-Open Range Operator
// ex) a ..< b (b 가 범위에 포함이 안됨)
//     ..<a

sum = 0
for num in 1 ..< 10 {
    sum += num
}
sum

list
list[..<2]

let range = 0 ... 5
range.contains(7) // 범위에 포함되는지 확인할 때 사용하는 함수
range.contains(1)

let range2 = ...5  // 단독으로 사용하면 lowerBound 는 무한대
range2.contains(-1)
range2.contains(Int.min)
