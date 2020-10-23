import UIKit

/*
 # Structure
 */

// 문법
// struct StructName {
//     property
//     method
//     initializer
//     subscript
// }

// 형식 내부에 구현하는 요소를 멤버라고 함
// property, method, initializer, subscript

struct Person {
    var name: String
    var age: Int
    
    func speak() {
        print("Hello")
    }
}

let p = Person(name: "Steve", age: 50)

p.name
p.age
p.speak()

// 함수는 이름만으로 호출 가능
// 메소드는 인스턴스 이름으로 접근해 호출

/*
 # Class
 */

// 문법
// class ClassName {
//     property
//     method
//     initializer
//     deinitializer (소멸자)
//     subscript
// }

class PersonClass {
    var name = "John Doe"
    var age = 0
    
    func speak() {
        print("Hello")
    }
}

let pc = PersonClass()
pc.name
pc.age
pc.speak()
