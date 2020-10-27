import UIKit

/*
 # Method Requirements
 */

// 프로토콜 메소드 선언 문법
// protocol ProtocolName {
//     func name(param) -> ReturnType
//     static func name(param) -> ReturnType
//     // 해당 프로토콜을 값 형식이 채용할 수 있고, 메소드 내부에서 속성을 변경해야 한다면 mutating 키워드를 추가하여 선언합니다. 프로토콜에서 mutating 은 메소드에서 값 형식을 변경할 수 있다는 것을 의미할 뿐입니다. 따라서 값 형식 뿐만 아니라 참조 형식에서도 문제없이 채용할 수 있습니다.
//     mutating func name(param) -> ReturnType
// }

protocol Resettable {
    func reset()
    mutating func resetValue()
    static func reset()
}

class Size: Resettable {
    var width = 0.0
    var height = 0.0
    
    // 메소드 이름, 파라미터 형식, returnType 만 일치한다면 메소드의 body 는 자유롭게 구현이 가능합니다.
    func reset() {
        width = 0.0
        height = 0.0
    }
    
    // class 에서는 mutating 키워드를 추가하지 않아도 메소드에서 속성을 자유롭게 변경할 수 있습니다.
    func resetValue() {
        width = 0.0
        height = 0.0
    }
    
    // overloading 규칙에 따라 이름이 같은 메소드를 인스턴스 메소드와 타입 메소드를 구현할 수 있습니다.
    // 이 메소드는 sub class 상속되지만 overriding 은 불가능합니다. overriding 을 가능하게 하려면 static 키워드를 class 키워드로 변경하면 됩니다.
    static func reset() {
        
    }
}

struct SizeValue: Resettable {
    var width = 0.0
    var height = 0.0
    
    func reset() {
        
    }
    
    // 값 형식의 인스턴스 메소드에서 속성을 변경하려면 mutating 키워드를 추가해야 합니다.
    mutating func resetValue() {
        width = 0.0
        height = 0.0
    }
    
    static func reset() {
        
    }
}
