import UIKit

/*
 # Result Type #1 (Swift 5+)
 
 - Result Type 을 이해하기 위해서 오류 처리 시스템이 어떻게 발전해 왔는지 간단히 살펴보겠습니다.
 
 - Swift 1.x 최초 버전에서는 Objective-C 와 동일한 방법으로 오류를 처리하였습니다. NSError 포인터를 사용해야 했기 때문에 포인터 사용을 지양하는 Swift 에는 어울리지 않는 방식이었습니다.
 
 - 그래서 Swift 2.x + 부터는 새로운 에러 처리 방식이 도입되었고 지금까지 사용되고 있습니다. 새로운 모델에서는 에러가 발생할 수 있는 코드 블록을 Throwing Function 이나 Throwing Method 로 선언합니다. 그리고 do-catch 문에서 try 표현식을 통해 호출하고 발생한 에러를 처리합니다. 에러 형식은 특별한 프로토콜을 채용한 형식으로 선언합니다.
 */

enum NumberError: Error {
    case negaticeNumber
    case evenNumber
}

enum AnotherNumberError: Error {
    case tooLarge
}

func process(oddNumber: Int) throws -> Int {
    // 음수가 전달된 경우
    guard oddNumber >= 0 else {
        throw NumberError.negaticeNumber
    }
    
    // 짝수가 전달된 경우
    guard !oddNumber.isMultiple(of: 2) else {
        throw NumberError.evenNumber
    }
    
    guard oddNumber < 1000 else {
        throw AnotherNumberError.tooLarge
    }
    
    return oddNumber * 2
}

do {
    let result = try process(oddNumber: 1)
    print(result)
} catch {
    print(error.localizedDescription)
}

// 에러를 올바르게 처리하기 위해서는 함수가 던지는 에러가 무엇인지 정확하게 파악해야 하는데 throws 키워드는 에러를 던진다는 것을 의미할 뿐 어떤 에러인지 특정 지을 수 없습니다. 따라서 함수 실행 후 전달되는 에러의 형식은 Error 프로토콜입니다.

// 어떤 에러가 전달되는지 파악했다면 해당 에러로 type casting 이 필요합니다.
do {
    let result = try process(oddNumber: 1)
    print(result)
} catch let myErr as NumberError {
    switch myErr {
    case .negaticeNumber:
        print("negative number")
    case .evenNumber:
        print("even number")
    }
} catch {
    print(error.localizedDescription)
}

// 이번에는 AnotherNumberError 에 있는 tooLarge 에러를 던지도록 guard 문을 추가해보겠습니다.

// 하나의 함수에서 두가지 에러를 던지고 있는데 이때 에러 없이 실행되기는 하지만 AnotherNumberError 를 올바르게 처리했다고 할 수는 없습니다. 컴파일러가 새로운 형식의 에러가 추가되었다는 것을 인식하지 못하기 때문에 에러 처리에서 논리적인 에러가 발생할 가능성이 높습니다.

// 만약 위 코드에서 패턴이 없는 catch block 을 삭제하는 경우에는 process 함수가 NumberError 만 던진다면 문제 없지만 다른 형식으로 에러를 던지면 런타임 에러가 발생합니다. 이런 경우 컴파일 시점에 에러를 파악할 수 없기 때문에 코드의 안정성이 낮아집니다.

// 동일한 코드를 Result Type 으로 처리해보겠습니다. Result 는 제네릭 열거형입니다. Success case 와 Failure case 가 선언되어 있고 연관 값을 가지고 있습니다. Success case 에 저장할 수 있는 형식에는 제한이 없지만 Failure case 에는 에러 형식만 저장할 수 있습니다. 두번째 형식 파라미터로 에러 형식을 명확히 선언하기 때문에 형식에 관한 모호함이 모두 사라집니다. 보통 작업의 결과는 성공과 실패 2가지 입니다. 작업이 성공하면 Success case 에 작업의 결과가 저장됩니다. 반대로 작업이 실패하면 Failure case 에 에러가 저장됩니다.

// Result Type 은 Throwing Closure 로 초기화하는 생성자를 제공합니다.
let result = Result{ try process(oddNumber: 1) }

// 이렇게 하면 result 상수에 Result 인스턴스가 저장되는데 이 인스턴스는 열거형입니다. 그리고 이 열거형은 Success case 와 Failure case 를 가지고 있습니다. 그래서 switch 문으로 처리할 수 있습니다.

switch result {
case .success(let data):
    print(data)
case .failure(let error):
    print(error.localizedDescription)
}

// 함수가 정상적으로 실행되면 Success case 와 매칭되고 연관된 값을 통해 리턴된 값을 사용할 수 있습니다. 반대로 에러가 전달되면 Failure case 와 매칭되고 전달된 에러는 연관 값을 통해서 얻을 수 있습니다. do-catch 문으로 작성한 코드보다 성공과 실패가 더 명확해졌습니다.

// 이번에는 process 함수에서 Reault Type 을 리턴하도록 변경해보겠습니다.
func processResult(oddNumber: Int) -> Result<Int, NumberError> {
    // 음수가 전달된 경우
    guard oddNumber >= 0 else {
        // return Result.failure(NumberError.negaticeNumber)
        // Throwing Function 에서는 형식 추론이 불가하기 때문에 전체 이름을 써야하는데 여기에서는 형식 이름을 생략할 수 있습니다.
        return .failure(.negaticeNumber)
    }
    
    // 짝수가 전달된 경우
    guard !oddNumber.isMultiple(of: 2) else {
        return .failure(.evenNumber)
    }
    
    return .success(oddNumber * 2)
}

// Result Type 으로 에러를 처리할 때는 함수에서 에러를 직접 던지지 않고 영문값으로 저장해서 리턴합니다. 이전 함수와 비교해보면 작업이 성공하면 Int 값이 리턴되고 작업에 실패하면 NumberError 가 발생한다는 것을 명확히 파악할 수 있습니다. 에러 형식을 직접 선언하기 때문에 형식 안정성이 보장되고 잘못된 형식으로 인해 발생하는 문제는 컴파일 에러를 통해서 바로 확인할 수 있습니다.

// 이전 함수와 비교해보면 에러를 직접 던지는 것이 아니라 연관 값으로 리턴합니다. 다시 말해서 함수를 Throwing Function 으로 선언하지 않습니다. 이런 차이때문에 함수를 호출하는 방식과 에러를 처리하는 방식이 달라집니다.

// 성공과 실패가 열거형으로 리턴되고 에러는 실제로 결과를 사용하는 시점에 처리합니다. Throwing Function 으로 구현하면 do block 에서 try 표현식을 호출하고 catch block 에서 바로 에러를 처리합니다. 반면 Result Type 으로 처리하면 인스턴스를 저장해두었다가 Switch 문으로 case 를 확인하고 연관 값에 저장된 에러를 처리합니다. 에러를 처리하는 시점이 함수를 호출하는 시점에서 작업 결과를 사용하는 시점으로 이동하였습니다. 이런 패턴을 Delayed Error Handling 이라고 합니다.

// 작업이 성공한 경우만을 처리하고 싶다면 Result Type 이 제공하는 get 메소드를 활용히면 처리가 가능합니다. 이 메소드는 작업이 성공하면 결과값을 리턴하고 실패하면 에러를 던지는 Throwing Method 입니다. 이 메소드의 결과는 do-catch 문이나 Optional try 로 처리하면 됩니다.

if let result2 = try? result.get() {
    print(result2)
}

// 이렇게 하면 작업이 성공한 경우에만 if 블록이 실행됩니다.

/*
 # Result Type #2 (Swift 5+)
 : 비동기 코드에서 Result Type 을 사용할 떄 어떤 장점이 있는지 알아보겠습니다.
 */

guard let url = URL(string: "http://kxcoding-study.azurewebsites.net/api/books") else {
    fatalError("invalid url")
}

struct BookListData: Codable {
    let code: Int
    let totalCount: Int
    let list: [Book]
}

struct Book: Codable {
    let title: String
}

enum ApiError: Error {
    case general
    case invalidFormat
}

typealias CompletionHandler = (Result<BookListData, ApiError>) -> ()

func parseBookList(completion: @escaping CompletionHandler) {
    let task = URLSession.shared.dataTask(with: url) {
        (data, response, error) in
        if let error = error {
            completion(.failure(.general))
            return
        }
        
        guard let data = data else {
            completion(.failure(.general))
            return
        }
        
        do {
            let list = try JSONDecoder().decode(BookListData.self, from: data)
            completion(.success(list))
        } catch {
            completion(.failure(.general))
        }
    }
    task.resume()
}

parseBookList { (result) in
    switch result {
    case .success(let data):
        data.list.forEach { print($0.title) }
    case .failure(let error):
        print(error.localizedDescription)
        
        switch error {
        case .general:
            // code
            break
        case .invalidFormat:
            // code
            break
        }
    }
}

//parseBookList { (data, error) in
//    if let error = error {
//        print(error.localizedDescription)
//        return
//    }
//
//    data?.list.forEach { print($0.title) }
//}


// Result Type 은 4가지 고차 함수를 제공합니다.
enum MyError: Error {
    case error
}

enum ValueError: Error {
    case evenNumber
}

func doSomethingWithResult(data: Int) -> Result<Int, MyError> {
    guard data.isMultiple(of: 2) else {
        return .failure(.error)
    }
    
    return .success(data)
}

// 먼저 map 을 보겠습니다. map 은 성공 값을 새로운 값으로 변환할 때 사용합니다.
let a = doSomethingWithResult(data: 0)
let b = a.map { $0.isMultiple(of: 2) ? "even number" : "odd number" }

// 위에서 사용한 map 은 Result Type 의 성공값을 클로저 파라미터로 전달합니다. 그런 다음 클로저에서 리턴한 값을 성공값으로 리턴해서 새로운 Result 인스턴스를 리턴합니다.
b

let c = a.flatMap { $0.isMultiple(of: 2) ? .success("even number") : .success("odd number") }

// 앞에서 살펴본 메소드와 동일하며 단지 여기에서는 실패값을 받아 처리한다는 점이 다릅니다. 
// a.mapError(<#T##transform: (MyError) -> Error##(MyError) -> Error#>)
// a.flatMapError(<#T##transform: (MyError) -> Result<Int, Error>##(MyError) -> Result<Int, Error>#>)
