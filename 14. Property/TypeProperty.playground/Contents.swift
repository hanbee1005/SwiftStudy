import UIKit

/*
 # Type Property
 : 형식 속성은 형식 자체에 속한 속성입니다. 인스턴스마다 개별 공간이 생성되지 않고 모든 인스턴스가 공유하는 하나의 공간만 생성됩니다. 그리고 모든 인스턴스가 여기에 저장된 값을 공유합니다.
 
 - 형식 속성은 class, structure, enumeration 모두에 추가할 수 있습니다.
 - 저장 속성과 계산 속성을 형식 속성으로 선언할 수 있습니다. 각각 저장 형식 속성과 계산 형식 속성이라고 부릅니다.
 */

// 문법 (저장 형식 속성)
// static var name: Type = DefaultValue -> Variable Stored Type Property
// static let name: Type = DefaultValue -> Constant Stored Type Property

// 접근 방법
// TypeName.propertyName

// 형식 자체에는 기본값이 없기 때문에 기본값을 생략 할 수 없습니다.
// 속성에 최초로 접근할 때 초기화 됩니다.

class Math {
    static let pi = 3.14
}

let m = Math()
// m.pi - 에러
Math.pi

// 문법 (계산 형식 속성)
// static var name: Type {
//     get {
//         statements
//         return expr
//     }
//     set(name) {
//         statements
//     }
// }

// class 에서 제한적으로 사용되는 문법
// class var name: Type {
//     get {
//         statements
//         return expr
//     }
//     set(name) {
//         statements
//     }
// }

enum Weekday: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    static var today: Weekday {
        let cal = Calendar.current
        let today = Date()
        let weekday = cal.component(.weekday, from: today)
        return Weekday(rawValue: weekday)!
    }
}

Weekday.today
