import UIKit

/*
 # Overriding
 : 상속 받은 멤버를 Sub Class 에 맞게 변경하는 것을 말합니다. Sub Class 에서 Super Class 와 동일한 멤버를 구현하는 것입니다. Overriding 이 가능한 멤버는 method, 속성, subscripts, 생성자입니다. Overriding 은 두 가지 방식으로 구현됩니다. 1. Super Class 구현을 기반으로 새로운 코드을 추가하거나 2. Super Class 구현을 무시하고 완전히 새롭게 구현합니다.
 */

class Figure {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Circle: Figure {
    var radius = 0.0
    
    var diameter: Double {
        return radius * 2
    }
    
    override func draw() {
        super.draw()  // 먼저 상위 구현을 호출
        print("🔵")   // 새롭게 구현
    }
}

let c = Circle(name: "Circle")
c.draw()

class Oval: Circle {
    // 계산 속성을 구현하거나 프로퍼티 옵저버를 사용하여 속성을 overriding 할 수 있습니다.
    // 읽기와 쓰기가 가능한 속성은 읽기 전용으로 오버라이딩 하는 것은 허용되지 않습니다.
    
    // 계산 속성으로 구현하기
//    override var radius: Double {
//        get {
//            return super.radius
//        }
//        set {
//            super.radius = newValue
//        }
//    }
    
    // 프로퍼티 옵저버로 구현하기
    // super 의 속성이 변수 저장 속성으로 되어 있는 경우 가능합니다.
    // 읽기 전용 속성의 경우에는 값이 변하지 않는 속성이므로 프로퍼티 옵저버로 오버라이딩 할 수 없습니다.
    override var radius: Double {
        willSet {
            print(newValue)
        }
        didSet {
            print(oldValue)
        }
    }
    
    // 읽기 전용 속성을 overriding 할 때 get block, set block 모두 구현 가능하지만 읽기 전용 속성의 값을 변경할 수는 없고 다른 속성의 값을 변경하는 것은 가능합니다.
    override var diameter: Double {
        get {
            return super.diameter
        }
        set {
            super.radius = newValue / 2
        }
    }
    
    // overriding 한 멤버에서 self 를 호출할 경우에는 재귀 호출이 발생하지 않게 주의해야 합니다.
}

// final 키워드를 사용하면 overriding 을 금지할 수 있습니다.
// final 키워드를 사용한다고 해서 상속 대상에서 제외되는 것은 아니며, 다만 overriding 만 금지가 됩니다.
