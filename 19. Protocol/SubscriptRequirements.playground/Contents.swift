import UIKit

/*
 # Subscript Requirements
 */

// 프로토콜 subscript 선언 문법
// protocol ProtocolName {
//     subscript(param) -> ReturnType { get set }
// }

protocol List {
    subscript(idx: Int) -> Int { get }
}

struct DataStore: List {
    subscript(idx: Int) -> Int {
        return 0
    }
}


protocol List2 {
    subscript(idx: Int) -> Int { get set }
}

struct DataStore2: List2 {
    subscript(idx: Int) -> Int {
        get {
            return 0
        }
        set {
            
        }
    }
}


// get 키워드는 필수이고 set 키워드만 필요에 따라 생략이 가능합니다. get 키워드만 사용한 경우에는 형식에서 subscript 구현 시 읽기 전용 subscript 를 구현하여도 되고 읽기, 쓰기가 모두 가능하도록 구현하여도 문제 없습니다. set 키워드가 선언된 경우에는 반드시 읽기와 쓰기가 가능하도록 구현하여야 합니다.

