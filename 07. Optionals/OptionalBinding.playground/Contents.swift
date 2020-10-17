import UIKit

/*
 # Optional Binding
 */

// OptionalExpression 을 평가해서 값이 리턴이 되면
// Unwrapping 되어서 상수에 저장됨. (이 상태가 바인딩이 성공한 상태)
// nil 이 리턴이 되면 실패...

// 코드가 더 안전해짐!


// 형태
// if let name: Type = OptionalExpression {
//     statements
// }

// while let name: Type = OptionalExpression {
//     statements
// }

// guard let name: Type = OptionalExpression else {
//     statements
// }

var num: Int? = nil

if let num = num {
    print(num)
    type(of: num)
} else {
    print("Empty")
}

var str: String? = "str"
guard let str = str else {
    fatalError()
}

str
type(of: str)

num = 123
if var num = num {
    num = 456
    print(num)
}

let a: Int? = 12
let b: String? = "str"

// 바인딩이 모두 성공하고 조건 또한 true 인 경우에 if 문이 실행됨.
if let num = a, let str = b, str.count > 5 {
    print("All success")
}
