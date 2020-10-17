import UIKit

/*
 # Function Types
 */

// (ParameterTypes) -> ReturnType

func sayHello() {
    print("Hello, Swift")
}

let f1 = sayHello
f1()

func printHello(with name: String) {
    print("Hello, \(name)")
}

let f2: (String) -> () = printHello(with:)
f2("Swift")
// 상수에 저장된 함수 호출 시 Argument Label 쓰지 않음

func add(a: Int, b: Int) -> Int {
    return a + b
}

var f3: (Int, Int) -> Int = add(a:b:)
f3(3,4)

func add(_ a: Int, with b: Int) -> Int {
    return a + b
}
f3 = add(_:with:)

func swapNumbers(_ a: inout Int, _ b: inout Int) {
    
}

let f4 = swapNumbers(_:_:)
f4

func sum(of numbers: Int...) {
    
}

let f5 = sum(of:)
f5

////////////////////////////////////////////////////////////////////

func add (_ a: Int, _ b: Int) -> Int {
    return a + b
}

func substract (_ a: Int, _ b: Int) -> Int {
    return a - b
}

func multiply (_ a: Int, _ b: Int) -> Int {
    return a * b
}

func divide (_ a: Int, _ b: Int) -> Int {
    return a / b
}

// 함수를 리턴하는 함수
typealias ArithmeticFunction = (Int, Int) -> Int

func selectFunction(from op:String) -> ((Int, Int) -> Int)? {
    switch op {
    case "+":
        return add(_:_:)
    case "-":
        return substract(_:_:)
    case "*":
        return multiply(_:_:)
    case "/":
        return divide(_:_:)
    default:
        return nil
    }
}

// 위와 동일
//func selectFunction(from op:String) -> ArithmeticFunction? {
//
//}

let af = selectFunction(from: "+")
af?(1, 2)

selectFunction(from: "*")?(12, 34)
