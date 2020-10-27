import UIKit

/*
 # Initializer Requirements
 */

// 프로토콜 생성자 선언 문법
// protocol ProtocolName {
//     init(param)
//     init?(param)
//     init!(param)
// }

protocol Figure {
    var name: String { get }
    init(name: String)
}

struct Rectangle: Figure {
    var name: String
    
    // 이 경우 Memberwise Initializer 로 자동 생성되는 생성자가 Protocol 에 선언된 생성자와 동일하기 때문에  Protocol 의 생성자를 구현하지 않아도 됩니다.
}

protocol Figure2 {
    var name: String { get }
    init(n: String)
}

struct Rectangle2: Figure2 {
    var name: String
    
    init(n: String) {
        name = n
    }
}

class Circle: Figure2 {
    var name: String
    
    // class 는 상속을 고려해야 하고 모든 sub class 에서 프로토콜의 요구사항을 충족시켜야 합니다. 그래서 클래스에서는 Required Inirializer 로 선언해야 합니다.
    required init(n: String) {
        name = n
    }
}

final class Triangle: Figure2 {
    var name: String
    
    // final class 의 경우 더 이상 상속되지 않기 때문에 상속을 고려할 필요가 없습니다. 그래서 required 키워드 없이도 요구사항을 충족 시킵니다.
    init(n: String) {
        name = n
    }
}

// 이미 super class 로부터 Protocol 요구사항을 상속하고 있기 때문에 다시 Figure2 를 채용하는 것은 중복이기 때문에 문법적으로 허용하지 않습니다.
// class Oval: Circle, Figure2 {
    
// }

class Oval: Circle {
    var prop: Int
    
    init() {
        prop = 0
        super.init(n: "Oval")
    }
    
    // 요구사항을 충족시키기 위해서 반드시 지정 생성자로 구현해야 하는 것은 아니며 다음과 같이 convenience initializer 로 구현하더라도 요구사항을 충족시킵니다. 다만, 여기에서도 required 키워드가 필요합니다.
    required convenience init(n: String) {
        self.init()
    }
}

protocol Grayscale {
    init(white: Double)
    // 프로토콜에서 생성자가 Failable Initializer 로 선언되어 있다면 Failable Initializer 와 Non-Failable Initializer 모두 요구사항을 충족시킵니다.
}

struct Color: Grayscale {
    // Protocol 생성자에서는 Non Optional 인스턴스를 반환하고 아래 생성자는 Optional 인스턴스를 반환하기 때문에 에러가 발생합니다.
    // init?(white: Double) {
    // }
    
    // 다음과 같은 경우 요구사항은 충족시키지만 초기화에 실패하는 경우 런타임 에러가 발생합니다.
    init!(white: Double) {
        
    }
}
