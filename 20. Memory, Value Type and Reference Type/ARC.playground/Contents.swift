import UIKit

/*
 # ARC(Automatic Reference Counting)
 
 - stack 에 저장된 데이터는 자동으로 제거되기 때문에 특별한 관리가 필요 없습니다. 하지만 heap 저장되는 데이터는 필요하지 않은 시점에 직접 제거해야 합니다. 메모리 저장 모델은 heap 에 저장되는 데이터를 관리합니다. 다시 말하면 클래스 인스턴스의 메모리를 관리합니다.
 - Swift 는 Objective-C 와 동일한 메모리 관리 모델을 사용합니다. Apple 이 제공하는 개발 환경을 Cocoa 라고 하는데 여기에서 사용하는 메모리 관리 모델입니다. Cocoa 에서 사용하는 메모리 관리 모델은 2가지입니다. Objective-C 에서는 두 모델을 모두 사용할 수 있지만 Swift 는 ARC 모델만 지원합니다. 두 모델을 이해하기 위해서는 소유 정책(Ownership Policy)과 참조 카운트(Reference Count)를 이해해야 합니다.
 - 인스턴스는 하나 이상의 소유자가 있는 경우 메모리에 유지됩니다. 반대로 소유자가 없다면 메모리에서 제거됩니다. 제거 시점을 파악하기 위해서 소유자 수를 저장하는데 이것을 참조 카운트라고 합니다. 참조 카운트로 다시 설명하면, 인스턴스는 참조 카운트가 1이상이면 메모리에 유지되고 참조 카운트가 0이 되면 메모리에서 제거됩니다.
 - 클래스 인스턴스를 변수에 저장하면 변수가 소유자가 됩니다. 이 시점에 인스턴스의 참조 카운트는 1입니다. 또 다른 변수가 인스턴스를 소유하면 참조 카운트는 2가 됩니다. 인스턴스를 소유하기 위해서는 특별한 메시지를 전달해야 합니다. 코드 레벨에서 보자면 인스턴스가 제공하는 retain 메소드를 호출하는 것과 같습니다. 인스턴스가 더 이상 필요하지 않다면 소유권을 포기해야 합니다. 소유권 획득과 마찬가지로 특별한 메시지를 전달합니다. 이 메시지는 release 메시지입니다.
 - MRC(Manual Reference Counting) 에서는 소유 정책과 관련된 코드를 하나부터 열까지 직접 구현합니다. 하지만 소유권을 제대로 처리하는 것은 정말 어렵고 많은 경험을 요구합니다. 메모리 오류가 발생할 가능성도 상당히 높습니다. 그래서 프로그래밍의 안정성이 낮아지고 디버깅이 어려워집니다.
 - 이런 문제를 해결하기 위해 ARC(Automatic Reference Counting) 이 도입되었습니다. ARC 는 소유 정책을 자동으로 처리합니다. 소유 정책과 참조 카운트를 처리하는 방식은 MRC 와 동일합니다. 하지만 컴파일러가 메모리 관리 코드를 자동으로 추가해주기 때문에 관련된 코드를 직접 작성할 필요가 없습니다. 작성해야 하는 코드의 양이 줄어들고 프로그램의 안정성도 증가합니다.
 - Swift 는 ARC 를 기본 모델로 사용합니다. MRC 는 여러가지 단점으로 인해 Swift 에서는 사용하지 않습니다. Objective-C 는 두 모델을 모두 지원하지만 특별한 이유가 없다면 ARC 를 사용합니다.
 - ARC 는 3가지 참조를 제공합니다.
 - 1. Strong Reference (강한 참조): 기본적으로 인스턴스와 소유자는 강한 참조로 연결됩니다. 대상을 소유할 때마다 참조 카운트가 1씩 증가하고 소유권을 포기할 때마다 1씩 감소합니다. 그리고 인스턴스는 소유자가 존재하는 동안에는 메모리에서 제거되지 않습니다.
 */

class Person {
    var name = "John Doe"
    
    deinit {
        print("person deinit")
    }
}

var person1: Person?
var person2: Person?
var person3: Person?

person1 = Person()
person2 = person1
person3 = person1

person1 = nil
person2 = nil
person3 = nil // 소멸자 호출 시점
