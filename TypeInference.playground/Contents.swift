import UIKit

/*
 # Type Inference - 형식 추론
 */

// 자료형을 지정하지 않았다면 초기값을 통해 해당 변수(또는 상수)의 타입을 지정함
// 이를, 타입 추론(Type Inference)라고 함

let num = 123
type(of: num)

let temp = 11.2
type(of: temp)

let str = "Swift"
type(of: str)

let a = true
let b = false
type(of: a)
type(of: b)


/*
 # Type Annotation
 */

// 자료형을 직접 지정하는 것을 의미함
// let name: Type = value
// var name: Type = value

let n: Int = 123
let value: Double
value = 12.3

let ch: Character = "c"

// 타입 추론을 하면 컴파일 시간이 길어지기 때문에 타입 annotation 을 사용하는 경우가 많음

/*
 # Type Inference Rules
 */

// 123     -> Int
// 1.23    -> Double
// "Hello" -> String
// true    -> Bool
// false   -> Bool
