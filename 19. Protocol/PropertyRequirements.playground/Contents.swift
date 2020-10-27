import UIKit

/*
 # Property Requirements
 */

// 프로토콜 속성 선언 문법
// protocol ProtocolName {
//     var name: Type { get set }
//     static var name: Type { get, set }
// }

// 프로토콜에서 변수는 항상 var 키워드로 선언합니다. 프로토콜에 포함된 var 키워드는 가변성과는 아무 관련이 없습니다. 단지 선언하는 멤버가 속성이라는 것을 나타내는 키워드로 사용됩니다.
// {} 사이에 오는 get, set 키워드가 가변성을 결정합니다. 두 키워드가 모두 포함되어 있다면 형식에서 읽기와 쓰기가 가능한 속성을 선언해야 합니다. 반대로 get 키워드만 포함되어 있는 경우에는 형식에서 읽기 전용 속성으로 선언해도 되고 읽기, 쓰기가 모두 가능한 속성으로 선언해도 문제가 없습니다.

protocol Figure {
    var name: String { get }
    static var name2: String { get set } // 이 경우 프로토콜을 채용하여 구현할 때도 해당 속성을 static 으로 해야 합니다.
}

struct Rectangle: Figure {
    // 읽기만 가능한 속성이므로 get, set 키워드가 모두 있는 경우 에러가 발생합니다. 여기서는 let 키워드를 var 키워드로 바꾸면 요구 사항을 충족할 수 있습니다.
    let name = "Rect"
    static var name2 = "Rect"
}

struct Triangle: Figure {
    var name = "Triangle"
    static var name2 = "Triangle"
}

struct Circle: Figure {
    // 읽기 전용 계산 속성이므로 get, set 키워드가 모두 있는 경우 에러가 발생합니다. 여기서는 set block 을 추가하면 요구 사항을 충족할 수 있습니다.
    var name: String {
        return "Circle"
    }
    
    static var name2: String {
        get {
            return "Circle"
        }
        set {
            
        }
    }
}

// static 키워드로 선언된 속성은 sub class 로 상속되지만 overriding 은 불가능합니다. overriding 을 허용하려면 static 키워드 대신 class 키워드로 선언해야 합니다.
class Circle2: Figure {
    
    var name: String {
        return "Circle"
    }
    
    class var name2: String {
        get {
            return "Circle"
        }
        set {
            
        }
    }
}
