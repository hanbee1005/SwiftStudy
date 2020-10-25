import UIKit

/*
 # Class Initializers
 
 클래스에서 구현할 수 있는 initializer 는 Designated Initializer 와 Convenience Initializer 로 구분됩니다.
 */

// Designated Initializer (지정 생성자)
// 클래스가 가진 모든 속성을 초기화 하는 메인 initializer 입니다.
// 클래스에서는 initializer 의 실행이 종료되기 전에 super 클래스의 designated initializer 가 실행되어야 합니다. 이것을 initializer Delegation 이라고 합니다.
// 클래스에서 구현할 수 있는 designated initializer 의 수에는 제한이 없습니다. 하지만 대부분의 경우 하나만 구현합니다.
// init(parameters) {
//     initialization
// }

// Convenience Initializer (간편 생성자)
// 다양한 초기화를 구현하기 위한 유틸리티 성격의 initializer 입니다. 반드시 모든 속성을 초기화 해야 하는 것은 아닙니다. 보통 필요한 속성만 초기화를 진행하고 클래스 내 다른 initializer 를 호출하여 나머지 속성의 초기화를 진행합니다.
// super class 의 designated initializer 를 직접 호출할 수 없습니다. 반드시 동일한 클래스에 있는 initializer 를 호출해서 최종적으로 designated initializer 가 호출될 수 있도록 구현해야 합니다.
// convenience init(parameters) {
//     initialization
// }

class Position {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    convenience init(x: Double) {
        self.init(x: x, y: 0.0)
    }
}

// Initializer Inheritance
// 다른 멤버들을 조건 없이 상속되지만 initializer 는 상속되는 조건이 상대적으로 까다롭습니다. 기본적으로 super class 에서 구현된 initializer 는 sub class 로 상속되지 않습니다.
// Swift 는 두가지 규칙에 따라 initializer 를 상속합니다. 1. sub class 의 모든 값이 기본 값으로 초기화 되어 있고, designated initializer 를 직접 구현하지 않았다면 super class 의 모든 designated initializer 가 상속됩니다. 2. sub class 가 모든 designated initializer 를 상속 받았거나 overriding 했다면 모든 convenience initializer 가 상속됩니다.

class Figure {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "unknown")
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Rectangle: Figure {
    var width: Double = 0.0
    var height: Double = 0.0
    
    init(name: String, width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init(name: name)
    }
    
    override init(name: String) {
        width = 0
        height = 0
        super.init(name: name)
    }
    
    // 항상 동일한 클래스에 있는 다른 initializer 를 호출하고 super class 의 initializer 를 호출하는 것은 불가능합니다. 그래서 overriding 이라는 개녕이 적용되지 않습니다. 
    convenience init() {
        self.init(name: "unknown")
    }
}
