import UIKit

/*
 # Operator Methods
 */

// static func operator(parameters) -> ReturnType {
//      statement
// }

// 연산자 부분에는 이미 있는 연산자가 와야함
// 연산자가 가지고 있는 우선순위와 결합 규칙을 바꾸지 않으며
// 원래 연산자의 기능과 동일한 기능을 수행하도록 만들어야 합니다.
// 원래 연산자의 parameters, ReturnValue 의 타입을 같게 해야 합니다.

"a" == "a"

struct Point {
    var x = 0.0
    var y = 0.0
}

extension Point: Equatable {
    // Complier 가 자동으로 추가
//    static func ==(lhs: Point, rhs: Point) -> Bool {
//        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
//    }
}

let p1 = Point(x: 12, y: 34)
let p2 = Point(x: 67, y: 89)

p1 == p2
p1 != p2

extension Point {
    static prefix func -(pt: Point) -> Point {
        return Point(x: -pt.x, y: -pt.y)
    }
}

let p3 = -p1
p3.x
p3.y

extension Point {
    static postfix func ++(pt: inout Point) -> Point {
        let ret = pt
        pt.x += 1
        pt.y += 1
        return ret
    }
}

var p4 = Point(x: 1.0, y: 2.0)
let p5 = p4++

p4.x
p4.y

p5.x
p5.y
