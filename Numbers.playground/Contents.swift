import UIKit

/*
 # Number Literals
 */

123
+123 // 양수 표시 (+ 생략 가능)
-123 // 음수 표시 (- 생략 불가)

0.23 // 실수 표시 (0 생략 불가)
1.23e4 // 지수 표현 (10진수)
0xAp2 // 지수 표현 (16진수)

1_000_000 // 금액을 처리하는 표현

10 // 10진수 10
0b1010 // 2진수 10
0o12 // 8진수 10
0xA // 16진수 10


/*
 # Integer Types
 */

// Int8
// Int16
// Int32
// Int64: 64bit 로 8byte 저장 가능

// 저장할 수 있는 값 범위 확인
Int8.min
Int8.max

// 메모리 크기 확인 (byte 크기 반환)
MemoryLayout<Int8>.size

// Signed vs Unsigned
// Signed: Int8, Int16, Int32, Int64
// Unsigned: UInt8, UInt16, UInt32, UInt64
UInt8.min
UInt8.max

// Int vs UInt
// 대부분 Int 를 사용하는데 가장 빠르게 정수를 처리할 수 있기 때문
MemoryLayout<Int>.size
Int.min
Int.max


let num = 123
type(of: num)


/*
 # Floating-point Types
 */

// Float: 4byte
// Double: 8byte
// 음수, 0 양수 다 저장됨
// 정수보다 큰 값을 저장할 수 있음 (지수와 가수를 나눠서 저장하기 때문)
// 메모리 크기에 따라 소수점 위치가 결정되어 오차가 발생할 수 있음

// 최대 소수점 6자리까지 보장 (그 이후는 오차 가능성 있음, 메모리에는 모두 저장됨)
// let pi: Float = 3.141592653589793238462643383279502884197169
// print(pi)

// type 지정을 안하면 그냥 Double
// 최대 15자리 소수점 보장
let pi = 3.141592653589793238462643383279502884197169
print(pi)
