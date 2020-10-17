import UIKit

/*
 # Optionals
 : 값을 가지지 않아도 되는 형식
 
 1. Optional 에 저장되어 있는 값을 사용하려면 값을 Unwrapping 해야 한다.
 2. nil 이 저장되어 있는 상태에서 강제 추출하면 에러가 발생한다.
 3. Optional 표현식을 Unwrapping 하면 Non-Optional 타입으로 결과가 리턴된다.
 */

let num: Int
// 변수와 상수는 반드시 초기화 해서 사용해야 함
// print(num) - 에러

// 저장할 값이 없는 경우 (ex. 네트워크 데이터를 가져오는 경우)

// nil
// : 값이 없음을 의미(포인터 x), 자체로는 추론할 형식이 없기 때문에 반드시 타입 annotation을 같이 사용하여야 함
let optionalNum: Int? = nil

// Non-Optional 타입은 항상 값을 가져야 함
let str: String = "Swift"
// let str: String = nil - 에러

// 기존 자료형에 ? 를 붙이면 값을 저장하지 않아도 되는 형식이 됨
let optionalStr: String? = nil

let a: Int? = nil
let b = a
b


// Unwrapping

var number: Int? = nil
print(number)

number = 123
print(number)

let n = 123
print(n)

// Forced Unwrapping (강제 추출)
// optionalExpression!
print(number!)

number = nil
// print(number!) - 에러: 값이 없는 경우에는 강제 추출이 불가능함
// 좀 더 안전하게 확인
if number != nil {
    print(number!)
}

number = 123
let before = number
let after = number! // 강제 추출해 값을 전달하기 때문에 Non-Optional 타입으로 전달

type(of: before)
type(of: after)
