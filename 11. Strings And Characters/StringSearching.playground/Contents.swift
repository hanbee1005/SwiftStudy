import UIKit

/*
 # String Searching
 */

let str = "Hello, Swift"

// 대소문자 구분해서 검색
str.contains("Swift")
str.contains("swift")
str.lowercased().contains("swift")

// 범위 검색
str.range(of: "Swift")
// 대소문자 구분 없이 범위 검색
str.range(of: "swift", options: [.caseInsensitive])


let str2 = "Hello, Programming"
let str3 = str2.lowercased()

// 접두어 검색
// 공통적인 접두어만 새로운 문자열로 리턴
var common = str.commonPrefix(with: str2)
common = str.commonPrefix(with: str3)

str.commonPrefix(with: str3, options: [.caseInsensitive])
str3.commonPrefix(with: str, options: [.caseInsensitive])

