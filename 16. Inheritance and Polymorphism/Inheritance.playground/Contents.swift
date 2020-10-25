import UIKit

/*
 # Inheritance
 
 - 상속 관계에 있는 클래스들은 상속 계층을 구성합니다.
 - 클래스 계층에서 가장 위에 있는 클래스를 Base Class 또는 Root Class 라고 합니다.
 - 바로 아래 계층의 클래스는 Base Class 를 상속합니다.
 - 상속 관계에서 위에 있는 클래스를 Super Class 라고 하거나 Parent Class 라고 합니다.
 - 그리고 아래쪽에 있는 클래스는 Sub Class 또는 Child Class 라고 합니다.
 - Objective-C 에서는 모든 클래스가 NSObject 라는 클래스를 상속해야 하지만 Swift 에서는 이런 제약이 없습니다.
 - 여러 Sub Class 가 하나의 Super Class 를 상속하는 것은 문제가 없지만, 하나의 Sub Class 가 두 개 이상의 Super Class 를 상속하는 것은 문제가 됩니다. 이것을 다중 상속이라고 하는데 Swift 에서는 지원되지 않습니다. 다중 상속과 유사한 패턴은 Protocol 을 통해 구현됩니다.
 - 다른 클래스를 상속하는 것을 Subclassing 이라고 합니다. Sub Class 는 Super Class 에 선언되어 있는 멤버들을 상속합니다. 마치 Sub Class 에 선언한 것처럼 자유롭게 사용이 가능합니다.
 - Super Class 에서 상속 받은 멤버가 Sub Class 에 맞지 않다면 구현을 수정하는 것도 가능합니다. 이것을 Overriding(재정의) 라고 합니다.
 - Super Class 에서 상속은 하면서 재정의를 금지하는 것도 가능합니다.
 */

// 문법
// class ClassName: SuperClassName {
// }

class Figure {
    var name = "Unknown"
    
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Circle: Figure {
    var radius = 0.0
}

// Circle 클래스에는 생성자를 구현하지 않았지만
// Circle 클래스가 Figure 클래스를 상속 받았기 때문에
// name 파라미터를 가지는 생성자를 사용할 수 있습니다.
let c = Circle(name: "Circle")
c.radius
c.name
c.draw()


// final class

// 문법
// final class ClassName: SuperClassName {
// }

// 다른 클래스를 상속하는 것은 가능하지만,
// 다른 클래스가 final class 를 상속 받는 것은 금지됩니다.
final class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
}

// final class 는 상속이 금지된 클래스로 아래 코드는 에러가 납니다.
//class Square: Rectangle {
//
//}
