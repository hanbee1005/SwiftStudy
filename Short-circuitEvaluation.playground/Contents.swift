import UIKit

/*
 # Short-circuit Evaluation
 단락 평가
 */

// 논리식에서 결과를 도출하는데 필요한 최소한의 코드를 실행하는 것을 의미

// && 연산자의 경우 처음 피연산자가 false 이면 다음 피연산자 확인 없이 바로 false
// false &&

// || 연산자의 경우 처음 피연산자가 true 이면 다음 피연산자 확인 없이 바로 true
// true ||

var a = 1
var b = 1

func updateLeft() -> Bool {
    a += 1
    return false
}

func updateRight() -> Bool {
    b += 1
    return true
}

if updateLeft() || updateRight() {
    
}

a
b

if updateLeft() && updateRight() {
    
}

a
b

// Side Effect
// 코드의 실행 결과로 인해 값 또는 상태가 바뀌는 것을 의미

// 논리식에 Side Effect 를 발생시킬 수 있는 코드가 포함되어 있으면
// 논리적이 오류가 발생할 가능성이 높기 때문에 주의!
let resultA = updateLeft()
let resultB = updateRight()

if resultA && resultB {
    
}

a
b

