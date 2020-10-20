import UIKit

/*
 # Iterating Collections
 : Collection 열거란, Collection 에 저장된 모든 요소를 대상으로
 반복적인 작업을 수행한다는 것
 */

// for-in
// for element in collection {
//     statements
// }

print("Array", "================")
let arr = [1, 2, 3]
for num in arr {
    print(num)
}

print("Set", "================")
let set: Set = [1, 2, 3]
for num in set {
    print(num)
}

print("Dictionary", "================")
let dict = ["A": 1, "B": 2, "C": 3]
for (key, value) in dict {
    print(key, value)
}

// forEach
// 반복적으로 실행하는 코드를 클로저 파라미터로 받음
// 이 파라미터는 하나의 파라미터를 가지면 값을 리턴하지는 않음

print("Array", "================")
let arr2 = [1, 2, 3]
arr2.forEach { (num) in
    print(num)
}

print("Set", "================")
let set2: Set = [1, 2, 3]
set2.forEach { (num) in
    print(num)
}

print("Dictionary", "================")
let dict2 = ["A": 1, "B": 2, "C": 3]
dict2.forEach { (elem) in
    print(elem.key, elem.value)
}

// 차이점
// 1. for-in 문에서는 break, continue 사용 가능
// 2. for-in 문에 포함된 return 문은 반복문이 포함된 코드 블록이 바로 종료되지만 forEach 문에 포함된 return 문은 해당 클로저의 실행만을 멈출 뿐 외부 및 반복 횟수에 영향을 주지 않음

func withForIn() {
    print(#function)
    let arr = [1, 2, 3]
    for num in arr {
        print(num)
        return
    }
}

func withForeach() {
    print(#function)
    let arr = [1, 2, 3]
    arr.forEach { (num) in
        print(num)
        return
    }
}

withForIn()
withForeach()
