import UIKit

/*
 # Protocol Composition
 : 하나의 형식은 다수의 프로토콜을 채용할 수 있습니다. 그리고 프로토콜을 채용한 하나의 인스턴스는 프로토콜 형식으로 저장될 수 있습니다.
 */

// 문법
// Protocol & Protocol & ...
// 프로토콜을 & 로 연결하면 병합된 임시 프로토콜로 처리됩니다. 여기에서 임시라고 표현한 것은 새로운 프로토콜 형식이 생성되는 것은 아니기 때문입니다.

protocol Resettable {
    func reset()
}

protocol Printable {
    func printValue()
}

class Size: Resettable, Printable {
    var width = 0.0
    var height = 0.0
    
    func reset() {
        width = 0.0
        height = 0.0
    }
    
    func printValue() {
        print(width, height)
    }
}

class Circle: Resettable {
    var radius = 0.0
    
    func reset() {
        radius = 0.0
    }
}

class Oval: Circle {
    
}

let r: Resettable = Size()
let p: Printable = Size()

// Resettable 과 printable 프로토콜을 모두 충족하는 형식으로 선언됩니다.
var rp: Resettable & Printable = Size()
// rp = Circle() - 에러

// Class & Protocol & ...
// Protocol Composition 에 클래스를 추가하면 모든 sub class 를 저장할 수 있게 됩니다.

var cr: Circle & Resettable = Circle()
cr = Oval()
