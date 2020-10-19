import UIKit

/*
 # String Options
 */

// 1. Case Insensitive Option
"A" == "a"
"A".caseInsensitiveCompare("a") == .orderedSame
"A".compare("a", options: [.caseInsensitive]) == .orderedSame

// .caseInsensitive == NSString.CompareOptions.caseInsensitive

// 2. Literal Option
// 코드 유닛이 달라도 최종 문자가 같다면 같은 문자로 인식
// 코드 유닛에 따라 문자를 비교하고 싶을 때 사용
let a = "\u{D55C}"
let b = "\u{1112}\u{1161}\u{11AB}"

a == b
a.compare(b) == .orderedSame
// literal option 을 사용하는 것이 더 빠름
a.compare(b, options: [.literal]) == .orderedSame

// 3. Backwards Option
// 검색 방향을 지정하는 옵션
let korean = "행복하세요"
let english = "Be happy"
let arabic = "كن سعيدا"

if let range = english.range(of: "p") {
    english.distance(from: english.startIndex, to: range.lowerBound)
}

if let range = english.range(of: "p", options: [.backwards]) {
    english.distance(from: english.startIndex, to: range.lowerBound)
}

// 4. Anchored Option
// 검색 범위를 문자열의 시작이나 끝으로 제한
let str = "Swift Programming"

if let result = str.range(of: "Swift") {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("no found")
}

if let result = str.range(of: "Swift", options: [.backwards]) {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("no found")
}

// 시작 부분만 검색
if let result = str.range(of: "Swift", options: [.anchored]) {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("no found")
}

// 마지막 부분만 검색
if let result = str.range(of: "Swift", options: [.anchored, .backwards]) {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("not found")
}

str.lowercased().hasPrefix("swift")
// 위와 같은 코드
if let _ = str.range(of: "swift", options: [.anchored, .caseInsensitive]) {
    print("same prefix")
}

str.lowercased().hasSuffix("swift")
// 위와 같은 코드
if let _ = str.range(of: "swift", options: [.anchored, .backwards, .caseInsensitive]) {
    print("same suffix")
}

// 5. Numeric Option
// 문자에 할당된 코드의 크기를 비교
"A" < "B"
"a" < "B"

let file9 = "file9.txt"
let file10 = "file10.txt"

file9 < file10
file9.compare(file10) == .orderedAscending

// 문자열에 포함된 숫자를 숫자 자체로 비교
file9.compare(file10, options: [.numeric]) == .orderedAscending

// 6. Diacrtic Insensitive
// 발음 기호를 처리하는 옵션

let aa = "Cafe"
let bb = "Cafè"

aa == bb
aa.compare(bb) == .orderedSame

// 발음 기호를 무시하고 문자를 비교할 때
aa.compare(bb, options: [.diacriticInsensitive]) == .orderedSame

// 7. Width Insensitive Option
// 전각, 반각 문자의 크기가 다른 경우 같은 문자라도 다르게 인식하기 때문에
// 이를 같게 비교하기 위해 사용
let aaa = "\u{30A1}" // 전각 문자
let bbb = "\u{ff67}" // 반각 문자

aaa == bbb
aaa.compare(bbb) == .orderedSame

aaa.compare(bbb, options: [.widthInsensitive])

// 8. Forced Ordering Option
// 강제 정렬 옵션
// 전체 옵션을 적용했을 때 같은 문자열로 판단된다면, 일부 옵션을 무시하고 최대한 문자열의 순서를 파악할 수 있는 값을 리턴
let upper = "STRING"
let lower = "string"

upper == lower
upper.compare(lower, options: [.caseInsensitive]) == .orderedSame
upper.compare(lower, options: [.caseInsensitive, .forcedOrdering]) == .orderedSame

// 9. Regular Expression
// 정규식 파악 옵션

let emailPattern = "([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\\.[0-9a-zA-Z_-]+){1,2}"
let emailAddress = "user@example.com😘"

if let _ = emailAddress.range(of: emailPattern) {
    print("found")
} else {
    print("not found")
}

if let range = emailAddress.range(of: emailPattern, options: [.regularExpression])
   , (range.lowerBound, range.upperBound) == (emailAddress.startIndex, emailAddress.endIndex) {
    print("found")
} else {
    print("not found")
}
