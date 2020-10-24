import UIKit

/*
 # Instance Method
 
 - Method 는 특정 형식에 속한 함수입니다.
 - 함수와 문법은 동일하지만 단지 구현하는 위치가 다르고 인스턴스를 통해 호출한다는 차이점 밖에 없습니다.
 - 함수는 특정 형식에 연관되지 않은 동작을 구현하고 메소드는 특정 형식에 연관된 동작을 구현합니다.
 - Instance Method 는 클래스, 구조체, 열거형에서 구현할 수 있습니다.
 - 인스턴스 속성처럼 특정 인스턴스와 연관된 동작을 구현합니다.
 - 보통 다른 인스턴스 멤버를 기반으로 구현하기 때문에, 인스턴스마다 실행 결과가 달라집니다.
 - 메소드 호출 문법은 함수 호출과 한가지 차이점을 가지고 있습니다. 함수는 함수 이름만으로 호출하지만 메소드는 인스턴스 이름을 통해 호출합니다.
 */

// 문법
// func name(parameters) -> ReturnType {
//     Code
// }

// 호출 방법
// instance.method(parameters)

class Sample {
    var data = 0
    static var sharedData = 123
    
    func doSomething() {
        print(data)
        // static 멤버를 인스턴스 멤버에서 사용할 수 없음
        // sharedData - 에러
        // 인스턴스 멤버에서 타입 멤버에 접근할 때는 형식 이름을 통해 접근
        Sample.sharedData
    }
    
    func call() {
        doSomething()
    }
}

let a = Sample()
a.data
a.doSomething()
a.call()

class Size {
    var width = 0.0
    var height = 0.0
    
    func enlarge() {
        width += 1.0
        height += 1.0
    }
}

let s = Size()
s.enlarge()

// 위 클래스를 구조체로 바꾸면 enlarge() 에러
// 클래스에서는 인스턴스 메소드가 인스턴스 속성을 얼마든지 변경할 수 있지만
// 구조체에서는 메소드를 mutating 으로 선언해야 변경이 가능합니다.
// 값 형식에서 속성을 바꾸는 메소드를 구현할 때는 반드시 mutating 으로 선언해야 합니다.
