import UIKit

/*
 # Switch Statement
 : 값의 일치 여부에 따라서 실행할 코드를 결정
 */

// switch valueExpression {
// case pattern:
//     statements
// case pattern, pattern:
//     statements
// default:
//     statements
// }

let num = 1

// 모든 경우의 수를 처리해야 하기 때문에 default 문을 넣어야 됨
switch num {
case 1:
    print("one")
case 2, 3:
    print("two or three")
default:
    break
}


// switch valueExpression {
// case pattern where condition:
//     statements
// default:
//     statements

switch num {
case let n where n <= 10:
    print(n)
default:
    print("others")
}


// Interval Matching
// 범위를 매칭 시키는 것

let temperature = -8

switch temperature {
case ..<10:
    print("Cold")
case 10...20:
    print("Cool")
case 21...27:
    print("Warm")
case 28...:
    print("Hot")
default:
    break
}

// Fall Through
// 다음 케이스 블록의 결과까지 수행하고 싶을 때 사용 (다음 케이스 조건 검사 x)
// 코드 중복 제거의 장점이 있음

let number = 2

switch number {
case 1:
    print("one")
case 2:
    print("two")
    fallthrough
case 3:
    print("three")
default:
    break
}

let attempts = 10

switch attempts {
case ..<10:
    print("warning")
case 10:
    print("warning")
    fallthrough
default:
    print("reset")
}
