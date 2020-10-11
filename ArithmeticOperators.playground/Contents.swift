import UIKit

/*
 # Arithmetic Operators
 산술 연산
 */

let a = 12
let b = 34

// + 연산자
// Unary Plus Operator
// ex) +a
+a
+b

// Addition Operator
// ex) a + b
a + b

// - 연산자
// Unary Minus Operator
// ex) -a
// 부호를 바꾸는 역할을 함. 음수 -> 양수, 양수 -> 음수
-a
-b

// Subtraction Operator
// ex) a - b
a - b

// x 연산자
// Multiplication Operator
// ex) a * b
a * b

// / 연산자
// Division Operator
// ex) a / b
// a 에서 b 를 나눈 몫이 출력
a / b
b / a

let c = Double(a)
let d = Double(b)
c / d
d / c

// % 연산자
// Remainder Operator (Modulo Operator)
// ex) a % b
// 나머지를 출력
// 실수의 경우 지원하지 않음.
a % b
b % a

// c % d
c.truncatingRemainder(dividingBy: d)

// Overflow
// 자료형에 저장할 수 있는 값의 범위를 벗어나는 문제를 말함.
// Swift 에서는 이를 허용하지 않음
// let num: Int8 = 9 * 9 * 9 - 에러
let num: Int = 9 * 9 * 9

// 컴파일 타임에 확인할 수 없는 에러도 있음.
// 가능하다면 큰 자료형을 사용하는 것이 좋음

// Overflow Operator
Int8.min
Int8.max

// Arithmetic operation '127 + 1' (on type 'Int8') results in an overflow
// let numOver: Int8 = Int8.max + 1 - 에러

// Overflow Addition Operator
// ex) a &+ b
let aa: Int8 = Int8.max
let bb: Int8 = aa &+ 1

// Overflow Subtraction Operator
// ex) a &- b
let cc: Int8 = Int8.min
let dd: Int8 = cc &- 1

// Overflow Multiplication Operator
// ex) a &* b
let e: Int8 = Int8.max &* 2

