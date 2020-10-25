import UIKit

/*
 # Deinitializer
 : 소멸자라고 부르며 인스턴스가 메모리에서 제거되기 전에 부가적인 정리 작업을 구현하기 위해 사용됩니다. Deinitializer 는 클래스 전용이며 하나로 제한됩니다. Deinitializer 는 직접 호출하지 않습니다. 인스턴스가 메모리에서 제거되기 직전에 자동으로 호출됩니다. 그래서 직접 호출하는 문법은 제공되지 않습니다. Deinitializer 를 구현하지 않으면 자동으로 제공됩니다. 파일 연결이나 네트워크 연결처럼 자동적으로 정리되지 않는 리소스를 정리하거나 인스턴스 해제를 확인하는 것처럼 디버깅 용도로 활용합니다.
 */

// 문법
// deinit {
//     Deinitialization
// }

class Size {
    var width = 0.0
    var height = 0.0
}

class Position {
    var x = 0.0
    var y = 0.0
}

class Rect {
    var origin = Position()
    var size = Size()
    
    deinit {
        // 인스턴스는 Deinitializer 의 실행이 완료될 때까지 메모리에 유지되기 때문에 self 로 접근하는 것이 가능합니다. 속성에 접근하거나 메소드를 호출하는 것도 가능합니다.
        print("deinit \(self)")
    }
}

var r: Rect? = Rect()
r = nil // 이 코드를 실행하면 Rect 인스턴스가 메모리에서 제거되며 Deinitializer 가 호출됩니다. Rect 인스턴스가 제거되는 시점에 속성에 저장되어 있는 다른 인스턴스도 함께 제거됩니다.
