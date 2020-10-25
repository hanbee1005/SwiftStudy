import UIKit

/*
 # Type Casting
 : 인스턴스 형식을 확인하거나 다른 형식을 인스턴스를 처리할 때 사용합니다.
 */

// Type Check Operator
// 문법
// expression is Type
// is 연산자라고 부르기도 합니다.
// 두 피연산자의 형식이 동일한 경우 true 를 리턴합니다.
// 왼쪽 피연산자의 형식이 오른쪽 피연산자와 동일한 상속 계층에 있고 오른쪽 피연산자가 슈퍼클래스라면 이때도 true 가 리턴됩니다.
// 나머지 경우에는 false 가 리턴됩니다.

let num = 123

num is Int
num is Double
num is String

class Figure {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Triangle: Figure {
    override func draw() {
        super.draw()
        print("🔺")
    }
}

class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
    
    override func draw() {
        super.draw()
        print("◼️ \(width) x \(height)")
    }
}

class Square: Rectangle {
    
}

class Circle: Figure {
    var radius = 0.0
    
    override func draw() {
        super.draw()
        print("🔴")
    }
}

let t = Triangle(name: "Triangle")
let r = Rectangle(name: "Rectangle")
let s = Square(name: "Square")
let c = Circle(name: "Circle")

r is Rectangle
r is Figure
r is Square

// type check 연산자는 런타임에 타입을 체크합니다.

// Type Casting Operator
// 문법
// expression as Type -> Compile Time Cast
// 컴파일 타임에 결과가 확정됩니다. 따라서 캐스팅에 성공하면 에러가 발생하지 않고 캐스팅에 실패하면 컴파일 에러가 발생합니다.

// expression as? Type -> Run Time Cast (Conditional Cast)
// expression as! Type -> Run Time Cast (Forced Cast)
// 런타임에 결정되기 때문에 컴파일 타임에는 결과를 알 수 없습니다.
// as? 의 경우 캐스팅에 성공하면 캐스팅된 인스턴스를 리턴하고 실패하면 nil 을 리턴합니다.
// as! 의 경우 강제 추출 연산자와 마찬가지로 캐스팅에 실패할 경우 crash 가 발생합니다. 따라서 forced cast 는 가능하면 사용하지 않는 것이 좋습니다.

// 주로 다운캐스팅을 할 때나 값 형식을 다른 형식으로 전환할 때 사용합니다.

// 왼쪽 피연산자의 형식이 오른쪽 형식과 호환된다면 오른쪽 형식으로 캐스팅 된 인스턴스를 리턴합니다. 새로운 인스턴스가 리턴되는 것은 아닙니다. 이미 존재하는 인스턴스에서 오른쪽 피연산자 형식에 있는 멤버만 접근할 수 있는 임시 인스턴스를 리턴합니다.

// 구조체로 구현된 String 자료형은 클래스로 구현된 NSString 자료형으로 호환됩니다.
let nsstr = "str" as NSString
// "str" as Int - 컴파일 에러 발생

t as? Triangle
t as! Triangle

var upcasted: Figure = s
// Upcasting 의 경우 항상 성공하기 때문에 Compile cast 를 사용할 수 있습니다.
// upcasted = s as Figure

// 하지만 Downcasting 에는 사용할 수 없습니다.
upcasted as? Square
upcasted as! Square

upcasted as? Rectangle
upcasted as! Rectangle

upcasted as? Circle
// upcasted as! Circle

// 실제로 Downcasting 을 할 경우 아래와 같이 사용하는 것이 좋습니다.
if let c = upcasted as? Circle {
    
}

// 배열의 경우 동일한 형식의 값들만 저장할 수 있는데, 모든 요소가 동일한 상속 계층에 있다면 가장 인접한 슈퍼 클래스로 Upcasting 되어 저장이 됩니다.
let list = [t, r, s, c]

// item 은 Figure 형식이지만 각 인스턴스에서 overriding 한 메소드가 호출됩니다. 이것을 다형성(Polymorphism)이라고 합니다. 즉, Upcasting 되어있는 인스턴스를 통해 메소드를 호출하더라도 실제 형식에서 overriding 된 메소드가 호출된다는 것입니다.
for item in list {
    item.draw()
    
    if let c = item as? Circle {
        c.radius
    }
}
