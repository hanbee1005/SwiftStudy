import UIKit

/*
 # Initializer Syntax
 : 생성자는 인스턴스를 만들 때 사용하는 특별한 메소드
 
 - 생성자는 모든 속성의 초기값을 저장하는데 이 과정을 인스턴스 초기화라고 합니다.
 - 생성자는 속성 초기화가 가장 중요하고 유일한 목적입니다.
 - 생성자 실행이 종료되는 시점에는 모든 속성의 초기값이 저장되어 있어야 합니다.
 */

// 문법
// init(parameters) {
//     statements
// }

let str = "123"
let num = Int(str)

class Position {
    var x: Double
    var y: Double
    
    init() {
        x = 0.0
        y = 0.0
    }
    
    init(value: Double) {
        x = value
        y = value
    }
}

let a = Position()
a.x
a.y

let b = Position(value: 100)
b.x
b.y
