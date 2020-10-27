import UIKit

/*
 # Protocol Extension
 : Extension 은 형식을 확장합니다. Protocol 역시 형식이기 때문에 Extension 으로 확장할 수 있습니다. Extension 으로 Protocol 을 확장하면 Protocol 을 채용한 모든 형식에 기본 구현을 제공할 수 있습니다.
 */

protocol Figure {
    var name: String { get }
    func draw()
}

extension Figure {
    func draw() {
        print("draw figure")
    }
}

struct Rectangle: Figure {
    var name = "Rectangle"
    
    func draw() {
        print("draw rectangle")
    }
}

let r = Rectangle()
r.draw()

// Protocol Extension 은 프로토콜을 채용한 모든 형식에 멤버를 추가합니다. 이번에는 멤버를 추가할 형식을 제한해 보겠습니다.

// 여기에서 Self 는 프로토콜을 채용한 형식을 의미합니다. 형식이 Equatable 프로토콜을 채용하고 있다면 where 절이 true 로 평가됩니다. 앞으로 프로토콜에서 구현한 멤버는 Figure 프로토콜을 채용하면서 동시에 Equatable 프로토콜을 채용하고 있는 형식에 제한적으로 추가됩니다.
extension Figure where Self: Equatable {
    func draw() {
        print("draw figure")
    }
}

// 위에서 선언한 Rectangle 구조체에서 draw 메소드를 삭제하면 에러가 발생합니다. Rectangle 구조체는 Equatable 프로토콜을 채용하고 있지 않기 때문에 Protocol Extension 에서 구현한 메소드는 추가되지 않습니다.
