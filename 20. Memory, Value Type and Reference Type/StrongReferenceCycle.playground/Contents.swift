import UIKit

/*
 # Strong Reference Cycle
 */

class Person {
    var name = "Jokn Doe"
    var car: Car?
    
    deinit {
        print("person deinit")
    }
}

class Car {
    var model: String
    var lessee: Person?
    
    init(model: String) {
        self.model = model
    }
    
    deinit {
        print("car deinit")
    }
}

var person: Person? = Person()
var rentedCar: Car? = Car(model: "Porsche")

person?.car = rentedCar // 속성과 인스턴스가 강한 참조로 연결되고 car 인스턴스의 참조 카운트는 또 1 증가한 2가 됩니다.

rentedCar?.lessee = person //

person = nil
rentedCar = nil

// 참조 카운트가 남아있어 여전히 메모리에서 제거 되지 않습니다. 두 인스턴스가 속성을 통해 서로를 소유하고 있기 때문입니다. 여기에서 문제는 person 변수와 rentedCar 변수에 nil 을 저장해서 더 이상 접근할 방법이 없다는 것입니다. 그래서 두 인스턴스를 정상적으로 해지할 방법이 없습니다.

// 이렇게 강한 참조 때문에 인스턴스를 제대로 해제할 수 없는 경우를 강한 참조 사이클이라고 합니다. ARC 는 메모리 관리를 대신 처리해 주지만 강한 참조 사이클까지 자동으로 처리하지는 못합니다.

// 강한 참조 사이클은 약한 참조(Weak Reference)와 비소유 참조(Unowned Reference)를 통해 해결합니다. 두 방식 모두 인스턴스 사이의 강한 참조를 제거하는 방식으로 문제를 해결합니다. 강한 참조와 달리 참조 카운트를 증가시키거나 감소시키지 않습니다. 그래서 참조를 통해 인스턴스에 접근할 수는 있지만 인스턴스가 사라지지 않도록 유지하는 것은 불가능합니다.

// 약한 참조는 인스턴스를 참조하지만 소유하지는 않습니다. 참조 카운트도 변하지 않습니다. 그래서 인스턴스를 참조하고 있는 동안 대상 인스턴스는 언제든지 사라질 수 있습니다. 이런 특징 때문에 소유자에 비해 짧은 생명 주기를 가지는 인스턴스를 참조할 때 주로 사용합니다. 약한 참조는 항상 Optional 형식으로 선언합니다. 그리고 var 키워드 앞에 weak 키워드를 추가합니다. 참조하고 있는 인스턴스가 해제되면 자동으로 nil 로 초기화 됩니다.

class Person2 {
    var name = "Jokn Doe"
    var car: Car2?
    
    deinit {
        print("person deinit")
    }
}

class Car2 {
    var model: String
    weak var lessee: Person2?
    
    init(model: String) {
        self.model = model
    }
    
    deinit {
        print("car deinit")
    }
}

var person2: Person2? = Person2()
var rentedCar2: Car2? = Car2(model: "Porsche")

person2?.car = rentedCar2 // 속성과 인스턴스가 강한 참조로 연결되고 car 인스턴스의 참조 카운트는 또 1 증가한 2가 됩니다.

rentedCar2?.lessee = person2

person2 = nil
rentedCar2 = nil

// 비소유 참조는 약한 참조와 동일한 방식으로 강한 참조 사이클을 해결합니다. 하지만 Optional 형식이 아니라 Non-Optional 형식입니다. 참조 사이클을 해결하면서 속성을 Non-Optional 로 선언해야 할 때 주로 사용합니다. 그리고 인스턴스의 생명 주기가 소유자와 같거나 더 긴 경우에 주로 사용합니다. 비소유 참조는 unowned 키워드를 통해 생성됩니다. 그리고 약한 참조와 달리 Non-Optional 형식으로 선언합니다. Optional 형식이 아니기 때문에 참조하고 있는 인스턴스가 해제되어도 nil 로 초기화되지 않습니다. 그래서 해제된 인스턴스에 접근할 경우 런타임 에러가 발생합니다.

class Person3 {
    var name = "Jokn Doe"
    var car: Car3?
    
    deinit {
        print("person deinit")
    }
}

class Car3 {
    var model: String
    unowned var lessee: Person3
    
    init(model: String, lessee: Person3) {
        self.model = model
        self.lessee = lessee
    }
    
    deinit {
        print("car deinit")
    }
}

var person3: Person3? = Person3()
var rentedCar3: Car3? = Car3(model: "Porsche", lessee: person3!)

person3?.car = rentedCar3

person3 = nil
rentedCar3 = nil
