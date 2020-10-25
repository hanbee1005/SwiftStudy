import UIKit

/*
 # Initializer
 : 생성자
 
 - 열거형, 구조체, 클래스는 모두 설계도입니다. 설계도를 기반으로 생성한 것을 인스턴스라고 합니다. 다른 언어에서는 객체에 한해 인스턴스라는 용어를 사용하지만 Swift 에서는 구분 없이 사용합니다. 새로운 인스턴스를 생성하는 것을 초기화라고 합니다. 인스턴스의 초기화를 담당하는 것이 바로 initializer 입니다.
 - 초기화는 모든 속성을 기본 값으로 초기화해서 인스턴스를 기본 상태로 만드는 것이 목적입니다. 인스턴스가 정상적으로 초기화 되었다는 것은 initializer 의 실행이 완료되었을 때, 모든 속성이 기본 값을 가지고 있다는 뜻입니다. 만약 기본 값이 없는 속성이 존재한다면 초기화에 실패하고 인스턴스는 생성되지 않습니다.
 */

// Default Initializer

class Position {
    var x = 0.0  // 속성이 주로 동일한 값으로 초기화 된다면 직접 값을 지정하는 방식으로 초기화 진행
    var y: Double
    var z: Double?  // optional 속성의 경우 값을 지정하지 않으면 자동으로 nil 로 초기화가 됩니다.
    
    // 파라미터를 통해 기본 값을 지정할 때는 주로 init() 을 사용하여 초기화
    init() {
        y = 0.0
    }
}

// 인스턴스를 생성하기 위해서는 initializer 를 호출해야 합니다. 따라서 모든 속성이 기본 값을 가지고 있고 initializer 를 직접 구현하지 않은 경우에는 컴파일러가 default initializer 를 자동으로 생성해줍니다. 만약 initializer 를 직접 구현하는 경우에는 default initializer 가 제공되지 않습니다.

let p = Position()

// Initializer Syntax
// 구현 문법
// init(parameters) {
//     initialization
// }

// 호출 방법
// TypeName(parameters)

class SizeObj {
    var width = 0.0
    var height = 0.0
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    convenience init(value: Double) {
        // width = value
        // height = value
        
        // initializer Delegation
        // : initializer 에서 다른 initializer 를 호출
        self.init(width: value, height: value)
    }
}

// Memberwise Initializer
// : initializer 를 구현하지 않았을 때 자동으로 제공되며 모든 속성의 값을 초기화 할 수 있도록 속성 이름과 동일한 파라미터를 받습니다.

struct SizeValue {
    var width = 0.0
    var height = 0.0
}

let s = SizeValue()
SizeValue(width: 1.2, height: 3.4)
