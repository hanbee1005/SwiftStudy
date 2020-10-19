import UIKit

/*
 # Strings and Characters
 */

// 문자열 리터럴
// 문자의 길이에 상관 없이 모두 String 문자열 타입
let s = "String"
let c = "C"

// 문자
// 반드시 타입 지정을 해줘야 함
let cc: Character = "C"

// 문자에 빈 문자를 추가하고 싶은 경우 반드시 공백을 넣어야 함
let emptyChar: Character = " "
// 문자열에서는 공백 없이 적어야 빈 문자열
let emptyString = ""

// 문자열 생성자로도 빈 문자열 생성 가능
let emptyString2 = String()


/*
 # String Types
 */

// String => Swift String
// 구조체로 구현되어 있으며, 값 형식

// NSString => Foundation String
// 클래스로 구현되어 있는 참조 형식

// 두 타입은 서로 호환 가능
// 타입 캐스팅 해서 사용할 수 있음
var nsstr: NSString = "str"
let swiftStr: String = nsstr as String
nsstr = swiftStr as NSString


/*
 # Mutability
 */

// 상수에 저장된 문자열은 변경이 불가하고
// 변수에 저장된 문자열만 변경이 가능
let immutableStr = "str"
// immutableStr = "new str"

var mutableStr = "str"
mutableStr = "new str"

/*
 # Unicode
 */

// Swift 는 Unicode 에 독립적인 문자열을 저장
let str = "Swift String"
str.utf8
str.utf16

var thumbUp = "👍🏻"
thumbUp = "\u{1F600}" // use unicode scala value

//😀
//활짝 웃는 얼굴
//유니코드: U+1F600, UTF-8: F0 9F 98 80


/*
 # Multiline String Literal
 */

let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipooscing elit, sed do eiusmod \n tempor incididunct ut labore et dolore magna aliqua."
print(loremIpsum)

// multiline String Literal 은 항상 새로운 라인에서 시작해야 함. """ 다음에 문자열 시작
// 마지막 """ 은 단독으로 있어야 하고 첫번째 줄과 같거나 왼쪽에 있어야 함. (들여쓰기의 기준이 되기 때문)
// 줄 마지막에 \ 를 추가하면 줄바꿈이 되지 않음
let multiline = """
Lorem ipsum dolor sit amet,
    consectetur adipooscing elit, sed do eiusmod
        tempor incididunct ut labore et dolore magna aliqua.
"""

print(multiline)
