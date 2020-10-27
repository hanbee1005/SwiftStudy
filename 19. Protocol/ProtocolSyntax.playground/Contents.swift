import UIKit

/*
 # Protocol Syntax
 : Protocol 을 간단하게 정리하면 형식에서 공통으로 제공하는 멤버 목록을 말합니다. Protocol 에는 형식에서 구현해야 하는 멤버가 선언되어 있습니다. 실제 구현은 Protocol 에 포함되지 않습니다. 대신 class 나 structure 같은 타입들이 실제 Protocol 의 멤버들을 구현하게 됩니다. 이것을 "프로토콜을 따른다"고 표현하거나 "프로토콜을 채용한다"고 표현합니다. 프로토콜을 채용한 형식은 반드시 프로토콜에 선언되어 있는 필수 멤버를 모두 구현해야 합니다. 그래서 이런 멤버들을 요구사항이라고 부르기도 합니다.
 */

// Defining Protocols
// 프로토콜 선언 문법
// protocol ProtocolName {
//     propertyRequirements
//     methodRequirements
//     initializerRequirements
//     subscriptREquirements
// }

// Protocol 은 상속을 지원합니다. Protocol 은 다중 상속을 지원합니다.
// protocol ProtocolName: Protocol, ... {
// }

protocol Something {
    func doSomething()
}

// Adopting Protocols
// 프로토콜 채용 문법
// enum TypeName: ProtocolName, ... {
// }

// struct TypeName: ProtocolName, ... {
// }

// class TypeName: SuperClass, ProtocolName, ... {
// }

struct Size: Something {
    func doSomething() {
        // Protocol 채용 시 헤더만 일치시키면 되고 바디는 자유롭게 구현하면 됩니다.
        print("doSomething")
    }
}

// Class-Only Protocols
// 기본적으로 프로토콜을 채용하는 형식에는 제한이 없지만 AnyObject 프로토콜을 상속하면 클래스 전용 프로토콜로 선언됩니다. 이렇게 하면 구조체나 열거형에서는 해당 프로토콜을 채용할 수 없게 됩니다.
// protocol ProtocolName: AnyObject {
// }

protocol SomethingObject: AnyObject, Something {
}

// 에러
// struct Value: SomethingObject {
//
// }

class Object: SomethingObject {
    func doSomething() {
        // SomethingObject Protocol 에는 구현해야할 메소드가 없지만 SomethingObject 가 Something Protocol 을 채용하고 있기 때문에 Something Protocol 의 doSomething 메소드를 구현해야 합니다.
    }
}
