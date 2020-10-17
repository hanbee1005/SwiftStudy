import UIKit

/*
 # Value Binding Pattern
 */

// case let name:
// case var name:

let a = 1

switch a {
case let x:
    // a 를 x 라는 상수에 저장 (let x = a = 1)
    print(x)
}

// 바인딩 된 상수는 케이스 문 안에서만 사용 가능

switch a {
case var x where x > 100:
    x = 200
    print(x)
default:
    break
}

let pt = (1, 2)

switch pt {
case let(x, y):
    print("x: \(x), y: \(y)")
case (let x, let y):
    print(x, y)
case (let x, var y):
    print(x, y)
case let(x, _):
    print(x)
}
