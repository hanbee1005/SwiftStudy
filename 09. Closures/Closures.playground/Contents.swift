import UIKit

/*
 # Closures
 */

// closures 표현식 문법
// { (parameters) -> ReturnType in
//     statements
// }
// 가장 단순한 표현식
// { statements }

// 문자열을 출력하는 가장 단순한 클로저
// global scope 에서 단독으로 사용 불가 (상수에 저장해서 사용 가능)
let c = { print("Hello, Swift") }
c()


// 파라미터와 리턴형이 있는 클로저
let c2 = { (str: String) -> String in
    return "Hello, \(str)"
}
// 클로저에서는 Argument Label 을 사용하지 않음
let result = c2("Closure")
print(result)


// 클로저를 파라미터로 전달하기
typealias SimpleStringClosure = (String) -> String

func perform(closure: SimpleStringClosure) {
    print(closure("iOS"))
}
perform(closure: c2)

// 클로저 자체를 직접 전달하는 것도 가능
// in-line 클로저라고 함
perform(closure: {(str: String) -> String in
    return "Hi, \(str)"
})


// 클로저 활용 예 1
let products = [
    "MacBook Air", "MacBook Pro",
    "iMac", "iMac Pro", "Mac Pro", "Mac mini",
    "iPad Pro", "iPad", "iPad mini",
    "iPhone Xs", "iPhone Xr", "iPhone 8", "iPhone 7",
    "AirPods",
    "Apple Watch Series 4", "Apple Watch Nike+"
]

var proModels = products.filter({(name: String) -> Bool in
    return name.contains("Pro")
})
print(proModels)

proModels.sort(by: {(lhs: String, rhs: String) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedAscending
})
print(proModels)

// 클로저 활용 예 2
print("Start")

DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
    print("End")
})

// 위와 같은 코드에서 문법 최적화를 한 경우
//DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//    print("End")
//}

/*
 # Closure Syntax Optimization (문법 최적화)
 : 최대한 단순하게 작성하는 것을 선호함
 */

products.filter({(name: String) -> Bool in
    return name.contains("Pro")
})

// 1. 파라미터 형식과 리턴형 생략 가능
products.filter({(name) in
    return name.contains("Pro")
})

// 2. Parameter name 은 Shortend Argument Name 으로 대체할 수 있고
//    이 경우 파라미터 이름과 in 키워드는 생략
//    $0: 첫번째 파라미터를 의미함
products.filter({
    return $0.contains("Pro")
})

// 3. 단일 return 문만 남아있는 경우 return 키워드 생략
products.filter({
    $0.contains("Pro")
})

// 4. closure parameter 가 마지막 parameter 라면
//    trailing closure 로 작성함
products.filter() {
    $0.contains("Pro")
}

// 5. 괄호 사이의 다른 parameter 가 없는 경우 괄호 생략
products.filter {
    $0.contains("Pro")
}

// 실습
proModels.sort {
    $0.caseInsensitiveCompare($1) == .orderedAscending
}
