import UIKit

/*
 # String Basics
 */

var str = "Hello, Swift String"
var emptyStr = ""
emptyStr = String()

let a = String(true)
let b = String(12)
let c = String(12.34)
let d = String(str)

// 123 을 16진수 문자열로 생성
let hex = String(123, radix: 16)

let octal = String(123, radix: 8)
let binary = String(123, radix: 2)

let repeatStr = String(repeating: "👏🏻", count: 7)
let unicode = "\u{1f44f}"

let e = "\(a) \(b)"
let f = a + " " + b
str += "!!"

str.count
str.isEmpty

// 문자열 구분 시 대소문자 구분
str == "Apple"
"apple" != "Apple"

// 사전 순 문자 비교 (같은 문자인 경우 ASCII 값 비교)
"apple" < "Apple"

// ed(), ing() 로 끝나는 메소드는 원래 값은 그대로 두고 새로운 값을 리턴
str.lowercased()
str.uppercased()
str

// 각 단어의 처음 문자를 대문자로 변경
str.capitalized
"apple ipad".capitalized

// 문자열은 Characters Sequence
for char in "Hello" {
    print(char)
}

let num = "1234567890"
num.randomElement()

// 문자열의 문자를 랜덤으로 섞어서 문자 배열로 리턴
num.shuffled()

