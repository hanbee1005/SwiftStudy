import UIKit

/*
 Bitwise Operators
 비트 연산자
 */

// 연산 속도가 빠르고 짦은 코드로 복잡한 로직을 구현할 때도 사용됨.
// 간단한 예로는 비트 플래그로 옵션을 지정할 때 주로 사용되고
// 하드웨어 드라이버를 만들거나, 임베디드 프로그램을 만들거나,
// 그래픽 처리를 하거나, 암호화 코드를 구현할 때도 자주 사용됨.

// Bitwise NOT Operator
// ex) ~a
// 0 -> 1, 1 -> 0

let a: UInt8 = 0b0000_0010
~a
0b1111_1101

// Bitwise AND Operator
// ex) a & b
// 모든 비트가 1인 경우에만 1이 됨

let b: UInt8 = 0b0010_0010
let c: UInt8 = 0b1100_1110
b & c
0b0000_0010

// Bitwise OR Operator
// ex) a | b
// 하나의 비트만 1이라도 1이 됨

b | c
0b1110_1110

// Bitwise XOR Operator (Exclusive OR)
// a ^ b
// 비트가 서로 다르면 1이 되고 같으면 0이 됨

b ^ c
0b1110_1100

// Logical Shift
// Bitwise Left Shift Operator
// a << n
// 메모리에 저장된 비트를 왼쪽으로 이동시키기
// 새로 추가되는 비트는 0임. 가장 왼쪽 비트는 이동하면서 사라짐.
// a * (n * 2) 와 같은 효과

let d: UInt8 = 0b0010_0010
d << 1
0b0100_0100

// Bitwise Right Shift Operator
// a >> n
// 메모리에 저장된 비트를 오른쪽으로 이동시키기
// 새로 추가되는 비트는 0임. 가장 오른쪽 비트는 이동하면서 사라짐.
// a / (n * 2) 와 같은 효과

d >> 1
0b0001_0001

// Arithmetic Shift
// a << n 의 경우는 Logical Shift 와 동일
// a >> n 의 경우 기존에 있던 Sign Bit가 젤 왼쪽에 채워짐

