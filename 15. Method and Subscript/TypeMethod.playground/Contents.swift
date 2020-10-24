import UIKit

/*
 # Type Method
 : 인스턴스가 아닌 형식에 연관된 메소드를 말합니다.
 
 - 클래스, 구조체, 열거형에서 모두 구현 가능합니다.
 */

// 문법
// static 키워드로 선언하면 오버라이딩이 금지됩니다.
// static func name(parameters) -> ReturnType {
//     statements
// }

// 서브 클래스에서 오버라이딩을 허용할 때 사용하는 문법입니다.
// 상속과 연관된 문법으로 클래스에서만 사용이 가능합니다.
// class func name(parameters) -> ReturnType {
//     statements
// }

// 호출 방법
// Type.method(parameters)

class Circle {
    static let pi = 3.14
    var radius = 0.0
    
    func getArea() -> Double {
        // 인스턴스 메소드에서 타입 속성에 접근할 때는 타입명을 사용하여 잡근합니다.
        return radius * radius * Circle.pi
    }
    
    class func printPi() {
        // 타입 메소드에서는 타입 속성에 바로 접근이 가능합니다.
        // 반면, 인스턴스 속성에 접근하는 방법은 없습니다.
        print(pi)
    }
}

Circle.printPi()

class StrokeCircle: Circle {
    // static 키워드로 선언된 타입 메소드는 오버라이딩이 불가능합니다.
    // 오버라이딩을 할 경우 class 키워드로 타입 메소드를 선언하여야 합니다.
    override static func printPi() {
        print(pi)
    }
}
