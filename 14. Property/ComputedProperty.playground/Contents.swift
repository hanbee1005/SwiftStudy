import UIKit

/*
 # ComputedProperties
 : 다른 속성을 기반으로 다른 속성이 결정되는 것을 의미합니다.
 
 - 계산 속성은 메모리 공간을 가지지 않습니다.
 - 다른 속성에 저장된 값을 읽어 필요한 계산을 수행한 다음에 리턴하거나 속성으로 전달된 값을 다른 속성에 전달합니다.
 - 이런 특징 때문에 속성에 접근할 때마다 다른 값이 리턴될 수 있습니다. 따라서 항상 var 키워드로 선언해야 합니다.
 - 선언 시 기본값을 지정할 수 없습니다. 따라서 형식 추론을 사용할 수 없고 반드시 자료형을 명시적으로 표시해주어야 합니다.
 - 계산 속성은 클래스, 구조체, 열거형 모두에 추가할 수 있습니다.
 */

// 문법
// var name: Type {
//     get {
//         statements
//         return expr
//     }
//     set (name) {
//         statements
//     }
// }

// get(get Block / geter): 속성 값을 읽을 때 실행됩니다. 반드시 return 키워드를 통해서 다른 속성에 있는 값을 리턴하거나 자료형과 동일한 값을 리턴해야 합니다.
// set(set Block / setter): 값을 저장할 때 실행됩니다. 문법에서 set 키워드 다음에 오는 name 은 파라미터 이름입니다. 속성에 저장할 값은 이 파라미터로 전달됩니다. set block 에서는 괄호와 파라미터 이름을 생략할 수 있는데 이 경우에는 newValue 라는 이름을 가진 기본 파라미터를 사용합니다.

class Person {
    var name: String
    var yearOfBirth: Int
    
    init(name: String, year: Int) {
        self.name = name
        self.yearOfBirth = year
    }
    
    var age: Int {
        get {
            let calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            return year - yearOfBirth
        }
        set {
            let calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            yearOfBirth = year - newValue
        }
    }
}

let p = Person(name: "John Doe", year: 2002)
p.age

p.age = 50
p.yearOfBirth

// Read-Only Computed Properties

// 문법
// var name: Type {
//     get {
//         statements
//         return expr
//     }
// }

// var name: Type {
//     statements
//     return expr
// }

// get block 없이 set block 만 쓰는 것은 문법적으로 허용되지 않습니다.

