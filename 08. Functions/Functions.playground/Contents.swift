import UIKit

/*
 # Functions
 */

// Calling Functions
// functionName(parameters)

print("hello, Swift")

// Defining Functions
// func name(parameters) -> ReturnType {
//     statements
// }
func sayHello() {
    print("Hello")
}
sayHello()

// Return Values
// func name(parameters) -> ReturnType {
//     statements
//     return expression
// }
// 역할 1. 함수를 실행을 중지한다.
// 역할 2. 함수의 리턴형이 선언되어 있다면, 리턴 키워드 다음에 오는 표현식을 평가 후 그 결과를 리턴한다.
func add() -> Int {
    return 1 + 2
}
let r = add()
print(r)

if add() == 3 {
    print("three")
}

func doSomething() {
    let rnd = Int.random(in: 1...100)
    
    if rnd % 2 == 1 {
        return
    }
    
    print(rnd)
}
doSomething()

// Parameters
// func name(parameters) -> ReturnType {
//     statements
// }
// (parameters) = (name: Type, name: Type)
// 파라미터는 함수 바디에서 사용할 수 있는 임시 상수
func add(a: Int, b: Int) -> Int {
    return a + b
}
// functionName(paramName: expr)
add(a: 1, b: 2)

// Default Value
// (name: Type = Value)
func sayHi(to: String = "Stranger") {
    print("Hi, \(to)")
}
sayHi(to: "Swift")
sayHi()

// 파라미터의 scope 는 함수 body 로 제한 (함수 내부에서만 사용 가능)
// 파라미터는 함수 호출 시 생성되었다가 함수 종료 시 자동으로 삭제
