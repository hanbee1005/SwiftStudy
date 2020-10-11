import UIKit

/*
 # guard Statement
 */

// Early Exit
// : 원하는 조건이 충족되지 않으면 불필요한 코드는 실행하지 않고 일찍 종료

// gaurd condition else {
//     // condition 이 false 일때 실행되며
//     // 코드의 실행을 중지(종료) 하는 코드 작성
//     statements
// }

// guard optionalBinding else {
//     statements
// }

func validate(id: String?) -> Bool {
    guard let id = id else {
        return false
    }
    
    guard id.count >= 6 else {
        return false
    }
    
    // 한번에 2개 이상 조건 확인 가능
    // guard let id = id, id.count >= 6 else {
    //     return false
    // }
    
    // 문자열이 있고 길이가 6보다 크거나 같은 경우 실행
    print(id)
    return true
}

validate(id: nil)
validate(id: "hello")
validate(id: "Good Morning")

func validateUsingIf() {
    var id: String? = nil
    
    if let str = id {
        if str.count >= 6 {
            print(str)
        }
    }
    
    // print(str) - 에러
    // if 문 안에서만 str 상수 사용 가능
}

func validateUsingGuard() {
    var id: String? = nil
    
    // 조건이 늘어도 중첩이 없어 코드 가독성이 더 좋음
    guard let str = id else {
        // print(str) - 에러
        return
    }
    guard str.count >= 6 else { return }
    
    print(str)
}

