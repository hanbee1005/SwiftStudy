import UIKit

/*
 # Stored Properties
 : 저장 속성은 형식 내부에 변수와 상수를 선언한 것입니다.
 저장 속성은 클래스와 구조체에서 선언할 수 있으며 인스턴스에 속한 속성입니다.
 따라서 인스턴스가 생성될 때마다 새로운 저장 공간이 생성됩니다. 바꿔 말하면 속성에 저장되는 값은 인스턴스마다 달라집니다.
 */

// 문법
// var name: Type = DefaultValue -> Variable Stored Property
// let name: Type = DefaultValue -> Constant Stored Property
// 형식 추론을 통해 타입을 생략할 수 있고
// 기본 값을 생략한다면 타입을 명시해야 합니다.

class Person {
    let name: String = "John Doe"
    var age: Int = 30
}

// 새로운 인스턴스를 만들고 속성 확인
// Explicit Member Expression

// 문법
// instanceName.propertyName
// instanceName.propertyName = NewValue

let p = Person()
p.name
p.age

p.age = 35
// p.name = "New Name" - 에러

struct PersonStruct {
    let name: String = "John Doe"
    var age: Int = 30
}

let ps = PersonStruct()
ps.name
ps.age

// 구조체를 상수에 저장하는 경우 구조체에 포함된 모든 속성이 상수가 됩니다.
// p.age = 35 - 에러

// 구조체의 가변성은 속성의 가변성에 영향을 준다는 것을 반드시 기억하기 바랍니다.
// 저장된 속성을 변경하려면 구조체 인스턴스를 변수에 저장해야 합니다.
var psv = PersonStruct()
psv.age = 35

// Lazy Stored Properties
// 인스턴스가 초기화 되는 시점에 속성이 초기화되는 것이 아니라
// 속성에 처음 접근하는 시점에 속성이 초기화됩니다. (초기화가 지연됨)

// 제한 사항 1. 지연 속성은 인스턴스가 초기화된 이후에 개별적으로 초기화되기 때문에 항상 변수 저장 속성으로 지정해야 합니다.
// 제한 사항 2. 생성자에서 초기화 하지 않기 때문에 선언 시점에 기본값을 저장해야 합니다.

// 문법
// lazy var name: Type = DefaultValue

struct Image {
    init() {
        print("new image")
    }
}

struct BlogPost {
    let title: String = "Title"
    let content: String = "Content"
    lazy var attachment: Image = Image()
    
    let date: Date = Date()
    
    // 저장 속성을 클로저로 초기화할 때 다른 속성에 접근해야 한다면
    // 지연 저장 속성으로 선언해야 합니다.
    lazy var formattedDate: String = {
       let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .medium
        return f.string(from: date)
    }()
}

var post = BlogPost()
// 속성 접근 시에 초기화가 진행됨
post.attachment

