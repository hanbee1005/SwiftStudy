import UIKit

/*
 # While Loop
 : 조건이 true 라면 반복해서 실행 (반복 횟수를 쉽게 예측할 수 없음)
   무한 루프에 빠지지 않도록 주의!
 */

// while condition(조건) {
//     statements
// }

var num = 1
var sum = 0

while num <= 100 {
    sum += num
    num += 1
}

sum


// repeat {
//     statements
// } while condition
// 코드를 먼저 실행하고 조건을 확인하게 됨

var number = 100
while number < 100 {
    number += 1
}
number

number = 100
repeat {
    number += 1
} while number < 100
number
