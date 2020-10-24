import UIKit

/*
 # Subscript
 */

// 문법
// instance[index]
// instance[key]
// instance[range]

let list = ["A", "B", "C"]
list[0]

// subscript 직접 구현하기
// subscript(parameters) -> ReturnType {
//     get {
//         return expression
//     }
//     set {
//         statements
//     }
// }

// [] 사이에 전달되는 값은 파라미터를 통해 전달됩니다. 파라미터의 수와 형식에는 제한이 없지만 대부분 2개 이하의 파라미터를 사용합니다. 그리고 가변 파라미터를 사용하는 것도 가능합니다. 하지만 입출력 파라미터로 선언하거나, 파라미터에 기본값을 지정하는 것은 불가능합니다. 그리고 서브스크립트를 통해 값을 받아야하기 때문에 파라미터를 생략하는 것도 불가능합니다.

// 리턴형은 서브스크립트에서 중요한 의미를 가지고 있습니다. 리턴되는 값의 형식인 동시에 저장하는 값의 형식입니다. 문법에서는 저장하는 값의 형식을 별도로 지정하지 않습니다. 대신 리턴형의 자료형을 저장하는 값의 자료형으로 사용합니다. 그래서 메서드와 달리 리턴형을 생략하는 것은 불가능합니다.

// get block, set block 모두 구현하면 subscript 를 통해 값을 읽고 쓸 수 있습니다. subscript 를 통해 저장한 값은 parameter 를 통해 set block 으로 전달됩니다. 파라미터 이름을 직접 쓰고 싶다면 set 키워드 뒤에서 선언합니다. 파라미터 이름을 생략한다면 newValue 라는 이름의 상수가 자동으로 생성됩니다. subscript 에서 값을 저장하지 않는다면 set block 을 생략합니다. 이렇게 하면 읽기 전용 subscript 가 됩니다. subscript 는 최소한 값을 읽을 수는 있어야 하기 때문에 get block 을 생략하고 set block 만 쓰는 것은 허용되지 않습니다.

class List {
    var data = [1, 2, 3]
    
    // subscript 에서는 파라미터 이름이 argument label 로 사용되지 않습니다. 따라서 argument label 이 필요하다면 직접 선언해야 합니다. subscript 에서 argument label 을 사용하는 경우는 상대적으로 적습니다.
    subscript(index: Int) -> Int {
        get {
            return data[index]
        }
        set {
            data[index] = newValue
        }
    }
}

var l = List()
l[0]
l[1] = 123

// l[0, 1] - 에러
// l["A"] - 에러

struct Matrix {
    var data = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ]
    
    // 읽기 전용 subscript
    subscript(row: Int, col: Int) -> Int {
        return data[row][col]
    }
}

let m = Matrix()
m[0, 0]
