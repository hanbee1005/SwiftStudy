import UIKit

/*
 # Implicitly Unwrapped Optionals
 - 특정 조건에서 강제 추출되는 Optional 타입
 */

// Type!

let num: Int! = 12

// 형식 추론을 사용하는 경우에는 자동으로 추출되지 않음
let a = num
type(of: a)

// IUO 는 Non-Optional 타입으로 처리되어야 할 때 자동으로 Unwrapping 됨
let b: Int = num
type(of: b)

let number: Int! = nil

// IUO 는 값을 강제로 자동 추출하기 때문에 nil 이 저장된 상태에서는 에러가 발생
// let c: Int = number - 에러


// iOS 앱 개발 시 IUO 를 만나는 경우
// 1. Outlet 을 연결할 때
// 2. API 에서 IUO 를 리턴하는 경우
// 두 가지 경우 모두 그냥 Optional과 Optional Binding 을 사용하면 됨.
