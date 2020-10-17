import UIKit

/*
 # Escaping Closure
 */

func performNonEscaping(closure: () -> ()) {
    print("Start")
    closure()
    print("End")
}
performNonEscaping {
    print("non-escaping closure")
}

// 함수의 실행이 종료된 후에도 시작하거나 종료할 수 있음
// 클로저의 실행 시작 시기와 종료 시기를 특정할 수 없음
func performEscaping(closure: @escaping () -> ()) {
    print("Start")
    
    var a = 12
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        closure()
        print(a)
        // 클로저가 캡처한 값 또한 클로저 실행 전까지 삭제되지 않고
        // 남아있을 수 있도록 함
    }
    
    print("End")
}
performEscaping {
    print("escaping closure")
}
