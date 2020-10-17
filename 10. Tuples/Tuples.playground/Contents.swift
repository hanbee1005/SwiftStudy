import UIKit

/*
 # Tuples
 */

// 표현식
// (expr1, expr2, ...)
// 각각의 expr 는 Tuple Member 라고 함

// Scala Type 은 값을 하나만 저장할 수 있음
// Int 등 기본 자료형은 Scala Type
// let i = 12, 34 - 에러

// Tuple 은 2개 이상의 값을 저장할 수 있음
// Tuple은 Component Type
// 서로 다른 형식의 값도 함께 저장 가능
let i = (12, 34)

let data = ("<html>", 200, "OK", 12.34)
data  // 자료형은 (String, Int, String, Double) 을 저장하는 튜플

// 튜플에 새로운 멤버를 저장하거나 삭제할 수 없음
// 단, 멤버의 값을 변경할 수는 있음

// 튜플 멤버에 접근할 때는
// tuple표현식.n
// n 은 0-based Index
data.0
data.1
data.2
data.3

// tuple 이 변수인 경우에만 tuple 멤버의 값을 변경할 수 있음
// data.1 = 404 - 에러
var mutableTuple = data
mutableTuple.1 = 404
mutableTuple.1

// Tuple 멤버에 이름이 없는 경우 index 로 접근함


/*
 # Named Tuple
 : 가독성을 높이기 위해 Tuple 멤버에 이름을 부여하는 방식
 */

// 표현식
// (name1: expr1, name2: eapr2, ...)

// 접근 방법
// tuple표현식.memberName

let named = (body: "<html>", codeStatus: 200, codeMsg: "OK", dataSize: 12.34)
named.0
named.body
named.codeStatus
named.codeMsg
named.dataSize


/*
 # Tuple Decompositon
 : 튜플에 저장되어 있는 멤버를 개별 상수나 개별 변수에 따로 저장하는 방식
 */

// 문법
// let (name1, name2, ...) = tupleExpr
// var (name1, name2, ...) = tupleExpr
// 상수, 변수의 수는 tuple의 멤버 수와 동일해야 함

let d = ("<html>", 200, "OK", 12.34)

// let body = d.0
// let code = d.1
// let message = d.2
// let size = d.3

let (body, code, message, size) = d
body
code
message
size

// 분해하고 싶지 않은 멤버는 _로 변경하여 처리할 수 있음


/*
 # Tuple Matching
 */

var resolution = (3840.0, 2160.0)

if resolution.0 == 3840 && resolution.1 == 2160 {
    print("4K")
}

// switch 문의 경우 tuple matching 을 지원하기 때문에
// 위와 같은 코드라도 더 간결하게 쓸 수 있음
switch resolution {
// interval matching 도 사용 가능
case (3840...4096, 2160):
    print("4K")
default:
    break
}

resolution = (1920.0, 1080.0)

switch resolution {
// wild card 문법도 사용 가능
case (_, 1080):
    print("1080p")
default:
    break
}

// value binding 활용
switch resolution {
case let(w, h) where w / h == 16.0 / 9.0:
    print("16:9")
default:
    break
}

