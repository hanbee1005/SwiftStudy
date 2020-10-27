import UIKit

/*
 # Error Handling
 
 - 보통 에러가 발생하면 프로그램이 강제로 종료되지만, 발생 가능한 에러를 직접 처리하면 강제 종료 없이 계속 프로그램을 실행할 수 있습니다.
 
 - 에러는 크게 Compile Time Error 와 Runtime Error 로 구분합니다. Compile Time Error 는 대부분 문법과 관련 있습니다. Compiler 가 제공하는 정보를 통해 비교적 쉽게 수정할 수 있고, Fix it 으로 수정하는 것도 가능합니다. Runtime Error 는 프로그램이 실행되는 동안 발생합니다. 문법적 에러가 아니더라고 디바이스나 리소스 상태에 따라서 에러가 발생할 수 있습니다. 보통 Runtime Error 가 발생하면 프로그램이 강제로 종료됩니다. 하지만 발생 가능한 에러를 미리 처리해두면 프로그램을 crash 없이 계속 사용할 수 있습니다. 강제 종료 횟수가 줄어들면 그만큼 사용성이 증가합니다.
 */

// 먼저 에러 형식부터 선언해보겠습니다. 에러 프로토콜을 채용하면 에러 형식이 됩니다. 그리고 대부분 열거형으로 선언합니다. 데이터 파싱에서 사용할 에러 형식을 열거형으로 선언해보겠습니다.

enum DataParsingError: Error {
    case invalidType
    case invalidField
    case missingRequiredField(String)
}

// Error 형식에는 필수 멤버가 선언되어 있지 않아서 프로토콜을 채용하겠다고 선언하는 것으로 충분합니다.

// 에러 형식은 Swift 에러 처리 시스템에 통합됩니다. 이제 데이터 파싱에서 에러가 발생하면 새로운 에러 인스턴스를 생성하고 에러를 처리하는 코드로 전달할 수 있습니다. 에러를 전달 받는 코드에서는 발생한 에러 종류를 확인하고 에러를 처리합니다.

// 에러를 전달하는 것을 "에러를 던진다"고 표현합니다. 이것은 에러를 전달하는 문법에서 throw 키워드를 사용하기 때문입니다.

// 문법
// throw expression

// throw 뒤에는 표현식이 오는데 에러 형식의 인스턴스가 옵니다. 일반 형식의 인스턴스가 오면 컴파일 에러가 발생합니다. 그리고 throw 문은 아무데서나 호출할 수 없습니다. 코드 블록이 에러를 던질 수 있다고 선언되어 있어야 합니다. 이런 코드 블록은 다음과 같이 선언합니다.

// 함수 문법
// func name(parameters) throws -> ReturnType {
//     statements
// }

// 생성자 문법
// init(parameters) throws {
//     statements
// }

// 클로저 문법
// { (parameters) throws -> ReturnType in
//     statements
// }


// throw 키워드는 에러를 던지는 키워드이고, throws 키워드는 함수, 메소드, 생성자, 클로저가 에러를 던질 수 있다고 선언합니다.

// 이렇게 선언에 throws 키워드가 선언된 블록은 Throwing Function / Method, Throwing Initializer, Throwing Closure 라고 부릅니다.

// 그러면 간단한 Throwing Function 을 구현해보겠습니다.
func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else {
        throw DataParsingError.missingRequiredField("name")
    }
    
    guard let _ = data["age"] as? Int else {
        throw DataParsingError.invalidType
    }
    
    // Parsing...
}

// throw 문은 return 문과 마찬가지로 코드 블록의 실행을 즉시 종료합니다. 다시 말해서 throw 문이 호출되면 같은 블록에 있는 나머지 코드는 실행되지 않습니다.

// 파라미터로 전달된 Dictionary 에 name 키가 추가되어 있고 age 키에 저장된 값은 Int 로 캐스팅할 수 있다면 throw 문은 호출되지 않습니다. 그렇다고 throws 키워드를 삭제할 수 없습니다. 뒤집어서 설명해보면 throws 키워드가 있다고 해서 코드 블록에서 항상 throw 문을 호출해야 하는 것은 아닙니다. 코드가 에러 없이 정상적으로 실행되면 throw 문은 호출될 필요가 없습니다. throw 문은 에러가 발생한 경우에만 호출되어야 합니다.

// Throwing Function 을 호출할 때는 try 표현식을 호출합니다. 문법을 보면 3가지 형태가 있습니다.

// try expression
// try? expression
// try! expression

// 표현식에는 주로 Throwing Function / Method, Throwing Initializer, Throwing Closure 를 호출하는 코드가 옵니다. 첫 번째 문법의 경우 do-catch 문과 함께 사용합니다. 나머지 두 문법의 경우 Optional 이 결합된 형태입니다. ? 가 붙어있는 문법은 Optional Try 라고 부르고 표현식에서 에러가 발생할 경우 nil 을 반환합니다. ! 가 붙어있는 문법은 Forced Try 라고 부르고 에러가 발생할 경우 런타임 에러가 발생합니다. 그래서 가능하다면 사용하지 않는 것이 좋습니다.

// 자동완성을 봤을 때 오른쪽에 throws 키워드가 있는 함수, 메소드, 생성자, 클로저는 반드시 try 표현식을 호출해야 합니다.

try? parsing(data: [:])

// 지금처럼 Optional Try 를 호출한 경우에는 crash 가 발생하지 않고 단지 nil 을 반환하고 호출문이 종료됩니다.

// 에러를 처리하는 방법은 크게 3가지로 분류됩니다.
// 1. do-catch Statements : 주로 코드에서 발생한 에러를 개별적으로 처리할 때 사용합니다.
// 2. try Expression + Optional Biniding
// 3. hand over : 전달받은 에러를 다시 다른 코드 블록으로 전달합니다.
