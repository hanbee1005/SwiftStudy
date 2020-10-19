import UIKit

/*
 # Raw String
 */

// "" : 문자열의 시작과 끝을 표현
// \ : escape 시퀀스로 사용

var str = "\"Hello\", Swift 5"

print("=== str ===")
print(str)

// raw String 은 특수 문자가 포함된 문자열을 쉽게 구성할 수 있음
// \ 와 " 를 문자 그대로 처리
// 정규식을 직관적으로 표현 가능
// 양쪽 # 문자의 수를 같게 해야 함.
var rawStr = #"\"Hello\", Swift 5"#

print("=== raw str ===")
print(rawStr)

str = "Lorem\nIpsum"
print(str)

rawStr = #"Lorem\nIpsum"#
print(rawStr)

rawStr = #"Lorem\#nIpsum"#
print(rawStr)

let value = 123
str = "The value is \(value)"
rawStr = #"The value is \#(value)"#

var zipCodeRegex = "^\\d{3}-?\\d{3}$"

let zipCode = "123-456"
if let _ = zipCode.range(of: zipCodeRegex, options: [.regularExpression]) {
    print("valid")
}

zipCodeRegex = #"^\d{3}-?\d{3}$"#
