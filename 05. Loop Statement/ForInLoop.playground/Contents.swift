import UIKit

/*
 # For-In Loop
 1. For-In 반복문은 지정된 범위만큼 반복하거나 Collection 을 열거할 수 있다.
 2. For-In 반복문은 얼마든지 중첩해서 사용가능하다.
 */

print("Hello")

// for loopConstant(반복 상수) in Range(범위) {
//     statements
// }

for index in 1 ... 5 {
    print(index)
}

// Wildcard Pattern
// _ 문자로 반복 상수를 생략할 수 있음
for _ in 1 ... 5 {
    print("hello")
}

let power = 10
var result = 1

for _ in 1 ... power {
    result *= 2
}

print(result)

// (from: 시작 범위, to: 끝 범위(포함 안됨), by: 지정된 수만큼 증가하면서 수행)
for num in stride(from: 0, to: 10, by: 2) {
    print(num)
}

// for loopConstant in Collection {
//     statements
// }

let list = ["Apple", "Banana", "Orange"]
for fruit in list {
    print(fruit)
}

// 중복 사용 가능
for i in 2 ... 9 {
    for j in 1 ... 9 {
        print("\(i) * \(j) = \(i * j)")
    }
}
