import UIKit

/*
 # Upcasting and Downcasting
 */

class Figure {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
    
    override func draw() {
        super.draw()
        print("◼️ \(width) x \(height)")
    }
}

class Square: Rectangle {
    
}

let f = Figure(name: "Unknown")
f.name

let r = Rectangle(name: "Rect")
r.width
r.height
r.name

// Upcasting
// : 서브클래스 인스턴스를 슈퍼클래스 형식으로 저장하는 것을 말합니다.
let s: Figure = Square(name: "Square")
//s.width
//s.height
//s.name

// Downcasting
// : Upcasting 된 인스턴스를 원래 형식으로 처리하기 위해 필요합니다. Upcasting 과 달리 에러가 발생할 수 있고 항상 성공하는 것도 아닙니다. Downcasting 에는 Typecasting 연산자를 사용합니다.

let downcastedS = s as! Rectangle
downcastedS.width
downcastedS.height
downcastedS.name

class Rhombus: Square {
    var angle = 45.0
}

// 원본 클래스보다 아래쪽에 있는 클래스로 Downcasting 하는 것은 허용되지 않습니다.
// let dr = s as! Rhombus -> 에러
