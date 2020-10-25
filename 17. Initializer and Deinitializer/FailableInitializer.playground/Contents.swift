import UIKit

/*
 # Failable Initializer
 : 실패를 허용하는 initializer 로 초기화에 실패하더라도 에러가 발생하지 않습니다. 대신 nil 을 리턴하게 됩니다.
 */

// 문법
// 초기화에 성공하면 초기화된 인스턴스가 Optional 형식으로 리턴됩니다. 반대로 초기화에 실패한다면 nil 을 리턴합니다.
// init?(parameters) {
//     initialization
// }

// 초기화에 성공한다면 인스턴스를 Non-Optional 형식으로 리턴합니다. 그리고 초기화에 실패하는 경우 crash 가 발생합니다.
// init!(parameters) {
//     initialization
// }

struct Position {
    var x: Double
    var y: Double
    
    init?(x: Double, y: Double) {
        guard x >= 0.0, y >= 0.0 else { return nil }
        
        self.x = x
        self.y = y
    }
    
    init!(value: Double) {
        guard value >= 0.0 else { return nil }
        
        x = value
        y = value
    }
}

var a = Position(x: 12, y: 34)

a = Position(x: -12, y: 0)

var b: Position = Position(value: 12)

// b = Position(value: -12)

// IUO 처리 방식을 알고 있어야 함

// Non Failable Initializer 에서는 ! 가 붙은 Failable Initializer 만 호출할 수 있습니다. 하지만 초기화가 실패하는 경우 crash 가 발생하기 때문에 이런 패턴은 사용하지 않는 것이 좋습니다.
// Failable Initializer 에서는 다른 Failable Initializer 를 호출해도 되고 Non Failable Initializer 를 호출해도 문제가 없습니다.
