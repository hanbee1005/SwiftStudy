import UIKit

/*
 # Any & AnyObject
 : 범용 자료형으로 Any 는 모든 형식을 저장할 수 있고, AnyObject 는 모든 클래스 형식을 저장할 수 있습니다.
 */

// Any 로 지정하면 형식에 관계 없이 모든 데이터를 저장할 수 있습니다.
var data: Any = 1
data = 2.3
data = "String"
data = [1, 2, 3]
data = NSString() // 값 형식, 참조 형식 상관 없이 모두 저장 가능합니다.

// AnyObject 에는 참조 형식만 저장할 수 있습니다.
var obj: AnyObject = NSString()
// obj = 1 -> 값 형식을 저장하는 것은 에러가 발생합니다.

// 이 외에도 Any 로 시작하는 다양한 형식들이 있는데 Swift 에서는 이를 Type-Erasing Wrapper or Type-Erased Wrapper 라고 합니다.

// Any 와 AnyObject 는 형식에 대한 정보를 가지고 있지 않습니다. 형식에 대한 정보가 없기 때문에 속성이나 메소드에 접근할 수 없습니다. 그해서 인스턴스를 사용하기 위해서는 타입 캐스팅이 필요합니다.

if let str = data as? String {
    print(str.count)
} else if let list = data as? [Int] {
    
}

// Type Casting Pattern
// switch 문과 type casting 연산을 함께 수행하는 패턴을 말합니다. 범용 형식으로 저장되었거나 Upcasting 된 인스턴스를 매칭 시킬 때 주로 사용합니다.
switch data {
case let str as String:
    print(str.count)
case let list as [Int]:
    print(list.count)
case is Double:
    print("Dounle Value")
default:
    break
}
