import UIKit

/*
 # Optional Requirements
 
 프로토콜에 선언된 모든 멤버가 필수 요구사항이기 때문에 해당 프로토콜을 채용하는 형식의 경우 프로토콜의 모든 멤버를 구현하여야 합니다.
 */

// 문법
// @objc protocol ProtocolName {
//     @objc optional requirements
// }
// @objc : objc Attribute - swift 로 작성한 코드를 objective-c 코드에서 사용할 수 있도록 하는 attribute 입니다.
// optional : optional Modifier - 선택적 멤버로 선언할 때 사용합니다.

// 이렇게 선언된 Protocol 을 objc protocol 이라고 부르기도 합니다. 그리고 이런 Protocol 은 클래스 전용입니다. 구조체나 열거형에서 해당 프로토콜을 채용하는 것은 불가능합니다. @objc 를 사용하면 AnyObject 프로토콜이 자동으로 상속되기 때문에 클래스에서만 채용할 수 있습니다.
@objc protocol Drawable {
    @objc optional var strokeWidth: Double { get set }
    @objc optional var strokeColor: UIColor { get set }
    func draw()
    @objc optional func reset()
}

class Rectangle: Drawable {
    func draw() {
        print("draw rect")
    }
}

let r: Drawable = Rectangle()
r.draw()

// 선택적 멤버에 접근할 때는 Optional Chaining 이 필요합니다. 선택적 멤버로 선언했다면 Optional 형식이 되기 때문입니다.
r.strokeWidth
r.strokeColor
r.reset?()

