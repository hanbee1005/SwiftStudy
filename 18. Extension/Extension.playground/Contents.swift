import UIKit

/*
 # Extension - Syntax
 : 확장이라는 의미를 가지고 있으며 형식을 확장하는 데 사용됩니다. 형식을 확장한다는 것은 속성, 메소드, 생성자와 같은 멤버들을 형식에 추가하는 것입니다. Extension 으로 확장할 수 있는 대상은 Class, Structure, Enumeration, Protocol 입니다. Extension 은 형식 선언에 새로운 멤버를 추가하는 것은 아닙니다. 새로운 멤버는 별도의 코드 조각으로 구현하고 형식과 연관 시켜서 기존 멤버와 함께 사용하는 것입니다. 형식 선언이 포함되어 있는 코드를 수정할 수 없는 경우에도 문제없이 확장할 수 있습니다. Int 나 String 같은 기본 자료형은 실제로 구조체로 구현되어 있습니다. Apple 이 제공하는 라이브러리를 직접 수정할 수는 없지만, extension 을 통해 기존 자료형에 새로운 멤버를 추가하는 것은 가능합니다. extension 으로 멤버를 추가하는 것은 가능하지만 기존 멤버를 overriding 하는 것은 불가능합니다. 만약 overriding 이 필요하다면 상속을 통해 subclassing 이 필요합니다.
 */

// 문법
// extension Type {
//     computedProperty
//     computedTypeProperty
//     instanceMethod
//     typeMethod
//     initializer
//     supscript
//     NestedType
// }

// 기존 형식에 프로토콜 구현을 추가할 때 사용하는 문법
// extension Type: Protocol, ... {
//     requirements
// }

struct Size {
    var width = 0.0
    var height = 0.0
}

extension Size {
    var area: Double {
        return width * height
    }
}

let s = Size()
s.width
s.height
s.area

extension Size: Equatable {
    public static func == (lhs: Size, rhs: Size) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}


/*
 # Adding Properties
 : extension 으로 추가할 수 있는 속성은 계산 속성으로 제한됩니다. 저장 속성을 추가하거나 property observer 를 추가하는 것은 불가능합니다. 그리고 형식에 존재하는 속성을 overriding 하는 것도 불가능합니다.
 */
extension Date {
    var year: Int {
        let cal = Calendar.current
        return cal.component(.year, from: self)
    }
    
    var month: Int {
        let cal = Calendar.current
        return cal.component(.month, from: self)
    }
}

let today = Date()
today.year
today.month

extension Double {
    var radianValue: Double {
        return (Double.pi * self) / 180.0
    }
    
    var degreeValue: Double {
        return self * 180.0 / Double.pi
    }
}

let dv = 45.0
dv.radianValue
dv.radianValue.degreeValue


/*
 # Adding Methods
 */
extension Double {
    func toFahrenheit() -> Double {
        return self * 9 / 5 + 32
    }
    
    func toCelsius() -> Double {
        return (self - 32) * 5 / 9
    }
    
    static func converToFahrenheit(from celsius: Double) -> Double {
        return celsius.toFahrenheit()
    }
    
    static func converToCelsius(from fahrenhsit: Double) -> Double {
        return fahrenhsit.toCelsius()
    }
}

let c = 30.0
c.toFahrenheit()

Double.converToFahrenheit(from: 30.0)

extension Date {
    func toString(format: String = "yyyyMMdd") -> String {
        let privateFormatter = DateFormatter()
        privateFormatter.dateFormat = format
        return privateFormatter.string(from: self)
    }
}

today.toString()
today.toString(format: "MM/dd/yyyy")

extension String {
    static func random(length: Int, charactersIn chars: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        var randomString = String()
        randomString.reserveCapacity(length)
        
        for _ in 0 ..< length {
            guard let char = chars.randomElement() else {
                continue
            }
            
            randomString.append(char)
        }
        
        return randomString
    }
}

String.random(length: 5)


/*
 # Adding Initializer
 */
extension Date {
    init?(year: Int, month: Int, day: Int) {
        let cal = Calendar.current
        var comp = DateComponents()
        comp.year = year
        comp.month = month
        comp.day = day
        
        guard let date = cal.date(from: comp) else {
            return nil
        }
        
        self = date
    }
}

Date(year: 1995, month: 10, day: 5)

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1.0)
    }
}

UIColor(red: 0, green: 0, blue: 255)

// 구조체의 경우 extension 을 통해 생성자를 추가하면 기존에 자동으로 제공되던 생성자와 함께 추가된 생성자를 같이 사용할 수 있습니다.
extension Size {
    init(value: Double) {
        width = value
        height = value
    }
}

Size()
Size(width: 12, height: 34)
Size(value: 12)


/*
 # Adding Subscripts
 */

// 문자열 기본 구현은 정수 인덱스를 subscript 로 전달할 수 없습니다. 반드시 String.Index 를 전달해야 합니다. 정수를 파라미터로 받는 subscript 를 형식에 추가하고 해당 위치에 있는 문자를 리턴하도록 구현해보겠습니다.
extension String {
    subscript(idx: Int) -> String? {
        guard (0 ..< count).contains(idx) else {
            return nil
        }
        
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])  // 형식에 구현되어 있는 다른 subscript 를 호출할 때는 self 를 사용합니다.
    }
}

let str = "Swift"
str[1]
str[100]

extension Date {
    subscript(component: Calendar.Component) -> Int? {
        let cal = Calendar.current
        return cal.component(component, from: self)
    }
}

today[.year]
today[.month]
today[.day]
