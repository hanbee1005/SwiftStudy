import UIKit

/*
 # Property Observer
 : 속성을 감시하는 역할을 하는 것입니다.
 
 - 변수 저장 속성에 추가할 수 있습니다.
 - 상수 저장 속성, 지연 속성, 계산 속성에는 추가할 수 없습니다.
 - 지연 저장 속성의 경우 초기화 코드에서 원하는 기능(속성 감시 등)을 구현하면 되고 계산 속성의 경우 set block 에서 필요한 기능을 구현하면 됩니다.
 - sub class 에서 계산 속성을 오버라이딩 하고 여기에 Property Observer 를 구현하는 것은 가능합니다.
 */

// 문법
// var name: Type = DefaultValue {
//     willSet(name) {
//         statements
//     }
//     didSet(name) {
//         statements
//     }
// }

// willSet: 속성에 값이 저장되기 직전에 호출됩니다. 새로 저장되는 값은 파라미터로 전달되고 파라미터 이름을 생략하면 newValue 라는 이름의 기본 파라미터를 사용합니다.
// didSet: 값이 저장된 직후에 호출됩니다. 이 시점에는 속성에 새로운 값이 저장되어 있습니다. 그래서 didSet block 에는 이전 값이 파라미터로 전달됩니다. 파라미터 이름을 생략하면 oldValue 라는 이름의 기본 파라미터를 사용합니다.
// willSet block, didSet block 은 필수 요소가 아니지만 모든 block 을 생략하는 것은 불가능합니다. Property Observer 가 되기 위해서는 반드시 두 블록 중 하나는 구현해야 합니다.

class Size {
    var width = 0.0 {
        willSet {
            print(width, "=>", newValue)
        }
        didSet {
            print(oldValue, "=>", width)
        }
    }
}

let s = Size()
s.width = 123
