import UIKit

/*
 self & super
 */

// self
// - 직접 생성하는 것이 아닌 인스턴스에 자동으로 추가되는 속성
// - self 는 인스턴스 멤버 내부에서 접근하면 해당 인스턴스에 접근합니다.
// - 그리고 타입 멤버 내부에서 접근한다면 형식 자체에 접근합니다.

// self -> 인스턴스 자체에 접근할 때 사용
// self.propertyName -> 인스턴스 속성에 접근할 때 사용 (self. 생략 가능)
// self.method() -> 인스턴스 메소드를 호출할 때 사용 (self. 생략 가능)
// self[index] -> 서브 스크립트를 호출할 때 사용 (self. 생략 불가능)
// self.init(parameters) -> 동일한 형식에 있는 다른 생성자를 호출할 때 사용합니다. (self. 생략 불가능)

class Size {
    var width = 0.0
    var height = 0.0
    
    func calcArea() -> Double {
        return width * height
    }
    
    var area: Double {
        return calcArea()
    }
    
    func update(width: Double, height: Double) {
        // 파라미터 이름과 속성 이름이 같은 경우 self 키워드로 구분
        self.width = width
        self.height = height
    }
    
    func doSomething() {
        // 클로저에서 속성에 접근하는 경우 self 를 캡처해야 하기 때문에 생략 불가
        let c = { self.width * self.height }
    }
    
    static let unit = ""
    
    static func doSomething() {
        // 형식 메소드에서 인스턴스 속성에 접근하는 것은 불가능
        // self.width - 에러
        
        self.unit // self. 생략 가능
    }
}

// 정리
// 1. self 는 현재 인스턴스에 접근하기 위해 사용하는 특별한 속성이다.
// 2. self 를 타입 멤버에서 사용하면 인스턴스가 아닌 형식 자체를 나타낸다.

struct SizeStruct {
    var width = 0.0
    var height = 0.0
    
    mutating func reset(value: Double) {
//        width = value
//        height = value
        self = SizeStruct(width: value, height: value)
    }
}

// super
// : 상속과 관련된 속성으로 클래스에서만 사용 가능

// super.propertyName
// super.method()
// super[index]
// super.init(parameters)
