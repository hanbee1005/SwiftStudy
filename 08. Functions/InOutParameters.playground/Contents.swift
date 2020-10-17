import UIKit

/*
 # In-Out Parameters
 : Argument 로 전달된 상수의 값을 직접 변경할 수 있음
 */

var num1 = 12
var num2 = 34

func swapNumber(_ a: Int, with b: Int) {
    // parameter 는 상수이므로 변경이 불가
    // var tmp = a
    // a = b
    // b = tmp
}

swapNumber(num1, with: num2)

// 선언 시 (name: inout Type)
// 호출 시 functionName(argLabel: &expr)
func swapNumber(_ a: inout Int, with b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}
num1
num2

swapNumber(&num1, with: &num2)

num1
num2

// Copy-In: Argument 로 전달된 값이 Parameter 로 복사되어 전달
// Copy-Out: 변경된 Parameter 의 값이 다시 Argument 로 복사되어 전달

// 자주 하는 실수
// - 동일한 변수를 두번 이상 전달하는 것은 불가능
// - 상수를 inout argument 로 불가능 (Copy-Out 이 불가능하기 때문)
// - 리터럴을 전달하는 것은 불가능 (리터럴은 메모리 공간도 없고 값을 저장할 수 없기 때문)
// - 기본값 지정도 불가능
// - 가변 파라미터는 입출력 파라미터로 사용 불가능
