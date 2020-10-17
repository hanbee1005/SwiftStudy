import UIKit

/*
 # Nil-Coalescing Operator
 : 값이 저장되어 있는지 확인하는 코드와 값을 추출하는 코드를 직접 작성하지 않아도 됨
 */

var msg = ""
var input: String? = "Swift"

if let inputName = input {
    msg = "Hello, " + inputName
} else {
    msg = "Hello, Stranger"
}
print(msg)

var str = "Hello, " + (input != nil ? input! : "Stranger")
print(str)

// 문법
// OptionalExpression ?? Expression
// String? ?? String
// Optional 표현식을 평가해서 값이 있으면 값을 Unwrapping 해 리턴하고 그 값을 연산에 사용함.
// 값이 없는 경우에는 오른쪽 피연산자를 평가해 그 값을 그냥 사용함.
// 주로 오른쪽 피연산자에는 값이 없을 때 사용할 기본값을 지정

str = "Hello, " + (input ?? "Stranger")
print(str)
