import UIKit

/*
 # String Comparision
 */

let largeA = "Apple"
let smallA = "apple"
let b = "Banana"

// Swift 는 기본적으로 대소문자를 구분하여 비교
largeA == smallA
largeA != smallA

largeA < smallA
largeA < b
smallA < b  // ASCII 코드 상 소문자 a 가 B 보다 큼

largeA.compare(smallA) == .orderedSame
// 대소문자 구분 없이 비교하고 싶다면
largeA.caseInsensitiveCompare(smallA) == .orderedSame
largeA.compare(smallA, options: [.caseInsensitive]) == .orderedSame

let str = "Hello, Swift Programming!"
var prefix = "Hello"
let suffix = "Programming"

str.hasPrefix(prefix)
str.hasSuffix(suffix) // 문자열을 뒤에서부터 비교해서 같은지 확인

prefix = "hello"
// 대소문자 구분 없이 비교하려면
str.lowercased().hasPrefix(prefix.lowercased())
