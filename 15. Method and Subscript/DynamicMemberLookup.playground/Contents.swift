import UIKit

/*
 # Dynamic Member Lookup
 : 파이썬과의 호환성을 위해 도입된 문법입니다. 점 문법으로 subscript 에 접근하는 단축 문법을 제공합니다.
 
 -
 */

@dynamicMemberLookup
struct Person {
    var name: String
    var address: String
    
    // @dynamicMemberLookup 을 지정하면 반드시 argument label 이 dynamicMember 이고 타입이 String 인 파라미터를 하나 가지는 subscript를 구현해야 합니다. ReturnType 은 경우에 따라 알맞게 지정합니다.
    subscript(dynamicMember member: String) -> String {
        switch member {
        case "nameKey":
            return name
        case "addressKey":
            return address
        default:
            return "n/a"
        }
    }
}

let p = Person(name: "James", address: "Seoul")
p.name
p.address

p[dynamicMember: "nameKey"]
p[dynamicMember: "addressKey"]

// Dynamic Member Lookup 은 점 문법을 통해 subscript 에 접근하는 것을 가능하게 합니다.
// 코드의 유연성이 높아진다는 장점이 있습니다.
// 하지만 대상에 접근하는 시점이 런타임이기 때문에 이에 따른 단점도 있습니다.
// 컴파일 타임에는 접근 가능한 subscript 를 판단하지 못합니다. 그래서 자동 완성이 제공되지 않습니다. 오타가 발생한다고 하더라도 컴파일 타임에는 확인할 방법이 없습니다. 이런 특성은 가독성과 유지보수에 문제가 있을 수 있습니다.
p.nameKey
p.addressKey

p.missingKey
