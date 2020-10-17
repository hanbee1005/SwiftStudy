import UIKit

/*
 # Argument Label
 */

func sayHello(name: String) {
    print("Hello, \(name)")
}
sayHello(name: "Swift")

// 함수 선언 시 파라미터 = Formal Parameter
// 함수 호출 시 파라미터 = Actual Parameter / Argument
// 호출 식에 있는 파라미터 이름 = Argument Label

// (name: Type) 의 경우
// ParameterName = ArgumentLabel
// (label name: Type) 의 경우
// ParameterName 은 name
// ArgumentLabel 은 label

// 함수 이름의 가독성을 높이기 위해 사용함

func sayHello(to name: String) {
    print("Hello, \(name)")
    // Argument Label 은 함수 호출을 위해 사용되므로
    // 함수 body 에서는 사용이 불가
}
sayHello(to: "Swift")

// Parameter Name 은 함수 body 에서 함수로 전달 값에 접근할 때 사용함.
// Argument Label 은 함수를 호출하면서 argument 를 전달할 때 사용함.

func sayHello(_ name: String) {
    print("Hello, \(name)")
}
sayHello("Swift")

// Argument Label 은 생략 가능하며 선언 시 생략했다면 호출 시에도 생략
// Parameter Name 은 생략 불가

// "함수 이름은 동사 + Argument Label 은 전치사 + Parameter Name 은 명사" 형태로 만드는 것이 좋음!
