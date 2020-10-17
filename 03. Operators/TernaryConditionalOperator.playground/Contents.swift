import UIKit

/*
 Ternary Conditional Operator
 삼항 연산자
 */

// ex) condition ? expr1 : expr2
//     조건 ? 참인 경우 : 거짓인 경우

let hour = 12

hour < 12 ? "am" : "pm"

// 1. condition 에 Bool 표현식이 와야 함
// 2. 2번째 피연산자와 3번째 피연산자의 타입이 동일해야 함

// if 문으로 변경 가능
if hour < 12 {
    "am"
} else {
    "pm"
}

// hour < 11 "Good Morning"
// hour < 17 "Good Afternoon"
// "Good Evening"
hour < 11 ? "Good Morning" : (hour < 17 ? "Good Afternoon" : "Good Evening")
