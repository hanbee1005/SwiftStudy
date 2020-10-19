import UIKit

/*
 # String Editing
 */

// Appending Strings and Characters
// 문자열 뒤에 새로운 문자열 추가
var str = "Hello"
str.append(", ") // 값을 리턴하지 않음 (대상 문자열을 직접 변경)
str

// 대상 문자열을 직접 변경하지 않고 새로운 값을 리턴
let s = str.appending("Swift")
str
s

"File size is ".appendingFormat("%.1f", 12.3456)


// 문자열 중간에 문자열 추가
var str2 = "Hello Swift"
str2.insert(",", at: str.index(str.startIndex, offsetBy: 5))

if let sIndex = str2.firstIndex(of: "S") {
    str2.insert(contentsOf: "Awesome ", at: sIndex)
}
str2

// Replacing Substrings
var str3 = "Hello, Objective-C"
if let range = str3.range(of: "Objective-C") {
    str3.replaceSubrange(range, with: "Swift")
}
str3

if let range2 = str3.range(of: "Hello") {
    let s = str3.replacingCharacters(in: range2, with: "Hi")
    s
    str3
}

var ss = str3.replacingOccurrences(of: "Swift", with: "Awesome Swift")
ss

// 대소문자 비교 없이 값을 찾아 변경
ss = str3.replacingOccurrences(of: "swift", with: "Awesome Swift", options: [.caseInsensitive])

// Removing Substrings
var str4 = "Hello, Awesome Swift!!!"
let lastCharIndex = str4.index(before: str4.endIndex)
var removed = str4.remove(at: lastCharIndex)
removed
str4

removed = str4.removeFirst()
removed
str4

str4.removeFirst(2)
str4

str4.removeLast()
str4

str4.removeLast(2)
str4

if let range = str.range(of: "awesome") {
    str4.removeSubrange(range)
    str4
}

// 메모리 공간도 같이 삭제
str4.removeAll()

// 메모리 공간을 유지
str4.removeAll(keepingCapacity: true)

str4 = "Hello, Awesome Swift!!!"

// 원본 문자열에서 마지막 문자를 제외한 나머지를 공유하게 됨
var substr = str4.dropLast()
substr = str4.dropLast(3)

// 문자열을 돌면서 문자가 , 일때 return
substr = str4.drop(while: { (ch) -> Bool in
    return ch != ","
})
substr

