import UIKit

/*
 # Required Initializer
 : 필수 생성자
 */

// 문법
// required init(parameters) {
//     initialization
// }

class Figure {
    var name: String
    
    // sub class 에서 반드시 해당 initializer 를 직접 구현해야 합니다.
    required init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

// sub class 의 모든 속성이 초기 값을 가지고 있고 initializer 를 구현하지 않은 경우 super class 의 intializer 가 상속되기 때문에 이 경우에는 required initializer 가 상속되어 직접 구현하지 않아도 됩니다.
class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
    
    init() {
        width = 0.0
        height = 0.0
        super.init(name: "unknown")
    }
    
    // sub class 에서 required initializer 를 구현할 때는 super class 의 required initializer 와 완전히 동일한 형태로 구현합니다. 이렇게 하는 이유는 Rectangle 을 상속 받는 다른 클래스들에서도 required initializer 를 구현하도록 다시 강제화 하기 위해서 입니다.
    required init(name: String) {
        width = 0.0
        height = 0.0
        super.init(name: name)
    }
}
