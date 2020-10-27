import UIKit

/*
 # do-catch Statements
 */

// 문법
// do {
//     try expression
//     statements
// } catch pattern {
//     statements
// } catch pattern where condition {
//     statements
// }

// do block 은 필수 블록입니다. 여기서는 try 표현식을 사용해서 에러가 발생할 수 있는 코드를 실행합니다. try 표현식에서 에러가 발생하면 do block 에서 이어지는 코드는 실행되지 않고 아래쪽에 있는 catch block 이 실행됩니다. catch block 은 do block 에서 발생한 에러를 처리합니다. 패턴으로 처리하고 싶은 에러를 선언하거나 패턴을 생략하고 전체 에러를 처리할 수도 있습니다. 그리고 where 절을 추가해서 매칭시킬 에러 패턴에 조건을 추가할 수 있습니다. do block 에서 발생 가능한 모든 에러는 catch block 을 통해 모두 처리되어야 합니다. catch block 을 생략한 경우에는 에러가 다른 코드로 전파될 수 있도록 구현해야 합니다.

enum DataPassingError: Error {
    case invalidType
    case invalidField
    case missingRequiredField(String)
}

func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else {
        throw DataPassingError.missingRequiredField("name")
    }
    
    guard let _ = data["age"] as? Int else {
        throw DataPassingError.invalidType
    }
    
    // Parsing...
}

do {
    try parsing(data: [:])
} catch DataPassingError.invalidType {
    print("invalid type error")
} catch {
    print("handle error")
}

// catch block 을 작성할 때는 가장 까다로운 패턴부터 작성하여야 합니다. 패턴이 생략된 catch block 은 항상 마지막에 작성되어야 합니다.

// 마지막에 작성된 catch block 을 삭제해보겠습니다. 현재는 do-catch block 이 global scope 에서 작성되었습니다. 이 경우에는 모든 에러를 처리하지 않아도 컴파일 에러가 발생하지 않습니다. 그러나 실제 프로젝트에서는 이렇게 global scope 에 작성하는 경우가 없습니다. 코드를 함수 내부로 이동시켜 보겠습니다.

func handleError() throws {
    do {
        try parsing(data: [:])
    } catch DataPassingError.invalidType {
        print("invalid type error")
    }
}

// 그러면 곧바로 컴파일 에러가 발생합니다. do-catch 문은 반드시 do block 에서 발생할 수 있는 모든 에러를 catch block 에서 처리해야 합니다. 에러를 해결하는 방법은 2가지입니다. 이전처럼 나머지 모든 에러를 처리하는 catch block 을 구현하거나 handleError 함수가 나머지 에러를 다른 코드로 던지도록 선언합니다.

// handleError 함수에 throws 키워드를 추가하면 invalidType 에러를 제외한 다른 에러는 handleError 함수를 호출한 코드로 전달됩니다. catch block 을 모두 생략하고 무조건 에러를 모두 던지도록 구현할 수도 있습니다. 이 경우에는 do-catch 문을 생략하고 바로 try 문을 작성해도 문제가 없습니다.

// 패턴이 없는 catch 블록은 패턴을 가진 catch 블록에서 처리되지 않은 나머지 모든 에러를 처리합니다. 그래서 어떤 에러가 발생했는지 판단할 수단이 필요합니다. 패턴이 없는 catch block 에는 error 라는 특별한 로컬 상수가 제공됩니다. 이 error 상수로 발생한 에러가 전달됩니다. error 상수의 경우 타입이 Error 프로토콜이기 때문에 Type Casting 이 필요합니다.
func handleError2() throws {
    do {
        try parsing(data: [:])
    } catch {
        if let error = error as? DataPassingError {
            switch error {
            case .invalidType:
                print("invalid type")
            default:
                print("handle error")
            }
        }
    }
}

// 패턴이 없는 catch block 은 대부분 이런 패턴으로 구현합니다.
