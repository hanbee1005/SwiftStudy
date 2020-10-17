import UIKit

/*
 # String
 */

// Swift 에서 문자열은 "" 로 묶여 있음
"Have a nice day"
"123" // 숫자로 구성되어도 "" 로 묶여 있어 문자열
"1" // 하나의 문자라고 해도 "" 로 묶여 있으면 문자열
let str = "1"
type(of: str)

/*
 # Character
 */

// Swift 에서 하나의 문자는 반드시 타입 지정을 해줘야 함
let ch: Character = "1"
type(of: ch)

// Character 문자 타입에는 하나의 문자만 저장할 수 있음
// let doubleCh: Character = "AA" - 에러

// Character 에 빈 문자를 저장하고 싶다면 빈 공백을 넣어야 함
let emptyCh: Character = " "
