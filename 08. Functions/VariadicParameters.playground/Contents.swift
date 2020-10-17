import UIKit

/*
 # Variadic Parameters
 : 가변 파라미터
 - 하나의 Parameter 로 하나 이상의 Argument 를 전달
 - Argument 전달 시 배열 형태로 전달
 */

// (name: Type...)

print("Hello")

print("Hello", "Swift")

func printSum(of nums: Int...) {
    var sum = 0
    for num in nums {
        sum += num
    }
    print(sum)
}
printSum(of: 1, 2, 3)
printSum(of: 1, 2, 3, 4, 5)

// 제약 조건
// - 개별 함수마다 가변 파라미터는 하나씩만 선언이 가능
// - 선언 순서는 상관 없음
// - 가변 파라미터는 기본값을 지정할 수 없음
