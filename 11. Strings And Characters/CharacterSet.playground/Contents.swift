import UIKit

/*
 # Character Set
 */

// 대문자가 포함된 문자열 모음
let a = CharacterSet.uppercaseLetters

// 대문자를 제외한 문자열 모음
let b = a.inverted

// 검색 코드 구현
var str = "loRem Ipsum"
var charSet = CharacterSet.uppercaseLetters

if let range = str.rangeOfCharacter(from: charSet) {
    print(str.distance(from: str.startIndex, to: range.lowerBound))
}

if let range = str.rangeOfCharacter(from: charSet, options: [.backwards]) {
    print(str.distance(from: str.startIndex, to: range.lowerBound))
}

str = " A p p l e "

// 문자열 양쪽의 공백 제거
charSet = .whitespaces

let trimmed = str.trimmingCharacters(in: charSet)
print(trimmed)

// CharacterSet 편집
var editTarger = CharacterSet.uppercaseLetters
editTarger.insert("#") // 문자 하나 추가
editTarger.insert(charactersIn: "~!@") // 여러 개 문자 추가

editTarger.remove("A") // 문자 하나 삭제
editTarger.remove(charactersIn: "BCD") // 여러 개 문자 삭제

// Custom CharacterSet 만들기
let customCharSet = CharacterSet(charactersIn: "@.")
let email = "userId@example.com"

let component = email.components(separatedBy: customCharSet)
