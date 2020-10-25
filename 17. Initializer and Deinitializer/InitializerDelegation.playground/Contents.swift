import UIKit

/*
 # Initializer Delegation
 : 초기화 코드에서 최대한 중복을 제거하고 모든 속성을 효율적으로 초기화 하기 위해 사용합니다. 값 형식과 참조 형식에서 서로 다른 방식으로 구현됩니다.
 */

// 값 형식은 상속이 불가능하고 initializer 종류가 하나이기 때문에 상대적으로 단순합니다.
struct Size {
    var width: Double
    var height: Double
    
    init(w: Double, h: Double) {
        width = w
        height = h
    }
    
    init(value: Double) {
        self.init(w: value, h: value)
    }
}

// Class 는 상속이 가능하고 구현할 수 있는 initializer 의 종류가 2가지이기 때문에 상대적으로 복잡합니다. 특히 상속 계층을 따라 올라가면서 모든 initializer 가 올바른 순서대로 호출되도록 구현하는 것이 매우 중요합니다.
// 1. Designated Initializer 는 반드시 super class 의 designated Initializer 를 호출해야 합니다. 이것을 Delegate Up 이라고 합니다. Designated Initializer는 동일한 클래스의 다른 Designated Initializer 를 호출하는 것은 불가능합니다. 이 경우 compile error 가 발생합니다.
// 2. Convenience Initializer 는 동일한 클래스에 있는 다른 Initializer 를 호출해야 합니다. 이것을 Delegate Across 라고 합니다. super class 에 있는 Convenience Initializer 는 동일한 클래스의 Initializer 를 호출해야 합니다. 호출할 Initializer 의 종류는 관계가 없습니다. 이는 sub class 에서도 마찬가지입니다. sub class 의 Convenience Initializer 에서 super class 의 Initializer 를 호출하는 것은 불가능합니다.
// 3. Convenience Initializer 를 호출했을 때 최종적으로 동일한 클래스에 있는 Designated Initializer 가 호출되어야 합니다.

class Figure {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "unknown")
    }
}

class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
    
    init(n: String, w: Double, h: Double) {
        width = w
        height = h
        super.init(name: n)
    }
    
    convenience init(value: Double) {
        self.init(n: "rect", w: value, h: value)
    }
}

class Square: Rectangle {
    convenience init(value: Double) {
        self.init(n: "Square", w: value, h: value)
    }
    
    convenience init() {
        self.init(value: 0.0)
    }
}
