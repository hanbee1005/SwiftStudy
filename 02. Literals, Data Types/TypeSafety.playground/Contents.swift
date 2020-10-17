import UIKit

/*
 # Type Safety
 */

// 엄격한 구분
// let str: String = 123
// let num: Int = 12.34

// 같은 타입이라도 저장공간 크기가 다르면 에러
//let a = 7
//let b: Int8 = a

// 자료형의 이름이 다르면 무조건 호환되지 않음
//let a = 7
//let b: Int64 = a

let a = 12
let b = 34.56

// 계산식에 포함된 데이터의 자료형이 같을 때만 계산이 가능
// let result = a + b

let rate = 1.94
let amount = 10_000_000
let result = rate * Double(amount)
type(of: result)

Int(rate * Double(amount))
Int(rate) * amount


/*
 # Type Conversion
 */

// Type Conversion: 메모리에 저장된 값을 다른 형식으로 바꿔 새로운 값을 생성
// Type Casting: 메모리에 저장된 값을 그대로 두고 컴파일러가 다른 형식으로 처리하도록 함

// Type(value)

let c = 123
let d = 4.56

Double(c) + d // 123.0 + 4.56
c + Int(d)    // 123 + 4

let e = Int8(c)
let f = Int.max

// Fatal error: Not enough bits to represent the passed value
// let g = Int8(f)

var str = "123"
var number = Int(str)

str = "number"
number = Int(str) // Type Conversion 실패 시 nil 이 반환됨

/*
 # Type Alias
 */

// 기본 자료형에 새로운 이름(별명)을 추가하는 문법
// typealias NewName = TypeName

typealias Coordinate = Double
let lat: Coordinate = 12.34
let lon: Coordinate = 56.78


