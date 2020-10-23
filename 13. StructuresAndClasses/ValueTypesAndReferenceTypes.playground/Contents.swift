import UIKit

/*
 # Value Types and Reference Types
 */

// Value Type: Structure, Enumeration, Tuple
// Reference Type: Class, Closure

struct PositionValue {
    var x = 0.0
    var y = 0.0
}

class PositionObject {
    var x = 0.0
    var y = 0.0
}

var v = PositionValue()
var o = PositionObject()

var v2 = v
var o2 = o

v2.x = 12
v2.y = 34

v
v2

o2.x = 12
o2.y = 34

o
o2

// 일반적인 규칙
// - 객체 지향 프로그래밍에서는 대부분 참조 형식인 클래스로 구현합니다.
// - 상대적으로 적은 데이터를 처리하고 상속이 필요하지 않다면 값 형식으로 구현합니다.
// - 값이 전달되는 시점마다 복사본이 생성되어야 하는 경우에도 마찬가지로 값 형식으로 구현합니다.
// - 연관된 상수 그룹을 표현할 때는 열거형으로 구현하고
// - 코드 내에서 한번만 사용되는 형식은 튜플로 구현합니다.
// - 나머지 값 형식은 모두 구조체로 구현합니다.
// - 프로토콜 지향 프로그래밍과 함수형 프로그래밍에서는 주로 구조체로 구현합니다.
// - 상속을 구현해야 하거나 참조를 전달해야 하는 경우에만 클래스로 구현합니다.
