import UIKit

/*
 Logical Operators
 논리 연산자
 참과 거짓을 구분하는 연산자로 모든 피연산자가 Bool 타입이고 결과도 Bool 타입
 */

// Logical NOT Operators
// ex) !a
// 참 -> 거짓, 거짓 -> 참
!true

let a = 12
let b = 34

a < b
!(a < b)

// Logical AND Operators
// ex) a && b
// a, b 모두 true 인 경우에만 true 를 반환
a > 30 && b % 2 == 0

true && true
true && false
false && true
false && false

// Logical OR Operators
// ex) a || b
// a, b 둘 중 하나만 true 라도 true 를 반환
a > 30 || b % 2 == 0

true || true
true || false
false || true
false || false
