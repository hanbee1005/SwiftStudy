import UIKit

/*
 # Overloading
 : 하나의 형식에서 동일한 이름을 가진 다수의 멤버를 구현할 때 사용합니다. 함수, 메소드, subscript, 생성자에서 오버로딩을 지원합니다.
 
 - 규칙1: 함수 이름이 동일하면 파라미터 수로 식별
 - 규칙2: 함수 이름, 파라미터 수가 동일하면 파라미터 자료형으로 식별
 - 규칙3: 함수 이름, 파라미터가 동일하면 Argument Label 로 식별
 - 규칙4: 함수 이름, 파라미터, Argument Label 이 동일하면 리턴형으로 식별
 */

func process(value: Int) {
    print("process Int")
}

func process(value: String) {
    print("process String")
}

func process(value: String, anotherValue: String) {
    
}

func process(_ value: String) {
    
}

process(value: 0)
process(value: "str")
process("str")

func process(value: Double) -> Int {
    return Int(value)
}

func process(value: Double) -> String {
    return String(value)
}

let result: Int = process(value: 12.34)
// let result = process(value: 12.34) as Int 동일

struct Rectangle {
    func area() -> Double {
        return 0.0
    }
    
    static func area() -> Double {
        return 0.0
    }
}

let r = Rectangle()
r.area()
Rectangle.area()

