import UIKit

/*
 # Nested Functions
 */

//func outer() {
//    print("outer")
//}
//
//func inner() {
//    print("inner")
//}
//
//outer()
//inner()

func outer() {
    func inner() {
        print("inner")
    }
    
    inner()
    
    print("outer")
}

outer()

// global scope 에서는 inner 함수를 직접 호출할 수 없음
// inner 함수는 outer 함수 내부에서만 호출이 가능 (scope 축소)

func outer2() -> () -> () {
    func inner() {
        print("inner")
    }
    
    print("outer")
    
    return inner
}

let f = outer2()
f()
