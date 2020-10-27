import UIKit

/*
 # Protocol Types
 : Protocol 은 First-class Citizen 으로 독립적인 하나의 형식입니다. 변수나 상수를 선언할 때 자료형으로 사용하거나 파라미터의 자료형으로 사용할 수 있습니다. 그리고 리턴형으로 사용하는 것도 가능합니다.
 */

protocol Resettable {
    func reset()
}

class Size: Resettable {
    var width = 0.0
    var height = 0.0
    
    func reset() {
        width = 0.0
        height = 0.0
    }
}

let s = Size()

// Protocol 형식으로 저장하면 Protocol 에 선언되어 있는 멤버만 사용할 수 있습니다.
let resettable: Resettable = Size()
// r.width - 에러
resettable.reset()

// Protocol Conformance
// : 프로토콜 적합성은 특정 형식이 프로토콜을 채용하고 있는지를 나타내는 척도입니다. 프로토콜 적합성은 type casting 연산자를 통해 확인합니다.

// 프로토콜 적합성 판단 문법
// 형식이 프로토콜을 채용하고 있는지 확인하는 문법
// instance is ProtocolName

// 인스턴스를 프로토콜 형식으로 캐스팅하거나 프로토콜 형식에 저장된 인스턴스를 실제 형식으로 캐스팅할 때 사용하는 문법
// instance as ProtocolName
// instance as? ProtocolName
// instance as! ProtocolName

s is Resettable
s is ExpressibleByNilLiteral

// 인스턴스를 프로토콜 형식으로 캐스팅할 때는 컴파일 타임 캐스트와 런타임 캐스트를 모두 사용할 수 있습니다. 하지만 원래 형식으로 캐스팅할 떄는 컴파일 타임 캐스트는 사용할 수 없습니다.
let rr = Size() as Resettable
rr as? Size

// Collections of Protocol Types
// 값 형식은 상속이 불가능하지만 Protocol 을 활용하면 상속과 유사한 패턴을 구현할 수 있습니다.

protocol Figure {
    func draw()
}

struct Triangle: Figure {
    func draw() {
        print("draw triangle")
    }
}

class Rectangle: Figure {
    func draw() {
        print("draw rect")
    }
}

struct Circle: Figure {
    var radius = 0.0
    
    func draw() {
        print("draw circle")
    }
}

let t = Triangle()
let r = Rectangle()
let c = Circle()

// 인스턴스가 값인지 참조 형식인지 파악하지 않고 같은 프로토콜 형식의 배열로 저장할 수 있습니다.
let list: [Figure] = [t, r, c]

for item in list {
    item.draw()
    
    if let c = item as? Circle {
        c.radius
    }
}

// 클래스에서 구현했던 업 캐스팅과 다운 캐스팅을 상속이 지원되지 않는 값 형식에서도 유사한 패턴으로 구현할 수 있습니다. 심지어 값 형식과 참조 형식에 관계 없이 함께 처리하는 것도 가능합니다.
