import UIKit

/*
 # Substring
 */

let str = "Hello, Swift"
let l = str.lowercased()

var first = str.prefix(1)

// Substring 은 원본 문자열의 메모리를 공유하여
// 메모리 공간을 아낄 수 있음
// 값을 변경하는 경우에 새로운 문자열이 생성됨.

first.insert("!", at: first.endIndex)

str
first

// Copy-on-Write Optimization
// : 불필요한 복사와 메모리 생성을 최대한 줄여 실행 성능을 높임

// 바로 새로운 문자열로 저장
let newStr = String(str.prefix(1))

// str.substring(to: str.index(str.startIndex, offsetBy: 2))
let s = str[str.startIndex ..< str.index(str.startIndex, offsetBy: 2)]
// 위와 같음
// let s = str[..<str.index(str.startIndex, offsetBy: 2)]

str[str.index(str.startIndex, offsetBy: 2)...]

let lower = str.index(str.startIndex, offsetBy: 2)
let upper = str.index(str.startIndex, offsetBy: 5)
str[lower ... upper]

