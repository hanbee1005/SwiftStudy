import UIKit

/*
 # Optional Try
 
 - 에러를 던지는 함수나 생성자를 호출할 때는 try 표현식을 사용해야 합니다. do block 이 아닌 다른 곳에서 호출할 때는 Optional try 와 Forced try 를 사용합니다. Optional try 는 표현식에서 에러가 전달된 경우 nil 을 리턴합니다. 반면 Forced try 는 실행을 중지합니다. 다시 말해서 런타임에러가 발생합니다. 두 표현식은 에러를 Optional 값으로 변경합니다. 따라서 주로 Optional Binding 과 함께 사용합니다.
 */

enum DataParsingError: Error {
    case invalidType
    case invalidField
    case missingRequiredField(String)
}

func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else {
        throw DataParsingError.missingRequiredField("name")
    }
    
    guard let _ = data["age"] as? Int else {
        throw DataParsingError.invalidType
    }
    
    // Parsing...
}

if let _ = try? parsing(data: [:]) {
    print("success")
} else {
    print("fail")
}

// 함수에서 에러가 발생하는 경우 바인딩이 실패하고 else block 이 실행됩니다.

// 위 코드를 do-catch 문으로 작성해 보겠습니다.
do {
    try parsing(data: [:])
    print("success")
} catch {
    print("fail")
}

// Optional try 를 사용할 떄 반드시 Optional Binding 을 사용해야 하는 것은 아닙니다. 그냥 함수만 호출하고 결과는 신경쓸 필요가 없다면 Optional try 만 작성하여도 무방합니다.

try? parsing(data: [:])

try! parsing(data: ["name": "steve", "age": 33])

// 지금은 파라미터로 올바른 딕셔너리를 전달하였습니다. 이 경우에는 아무런 문제가 없습니다. 딕셔너리를 빈 딕셔너리로 변경 후 코드를 실행하면 런타임 에러가 발생합니다. 실제 디바이스에서 실행할 경우 crash 가 발생합니다. Forced try 는 표현식에서 발생한 에러를 다른 곳으로 전달할 수 없습니다. 그리고 do-catch 를 통해 에러를 처리하는 것도 불가능합니다. 에러가 발생하는 즉시 프로그램이 강제로 종료되기 때문입니다. 그래서 Forced try 는 가능하면 사용하지 않는 것이 좋습니다. 에러가 발생하지 않는 것이 확실한 경우에만 제한적으로 사용하여야 합니다.
