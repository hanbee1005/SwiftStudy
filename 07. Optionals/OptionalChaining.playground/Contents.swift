import UIKit

/*
 # Optional Chaining
 : Optional 을 연달아서 호출하기
 특징 1. Optional Chaining 의 결과는 항상 Optional 이다.
 특징 2. Optional Chaining 에 포함된 표현식 중에서 하나라도 nil 을 리턴한다면 이어지는 표현식을 평가하지 않고 nil 을 리턴한다.
 */

struct Contects {
    var email: [String: String]?
    var address: String?
    
    func printAddress() {
        return print(address ?? "no address")
    }
}

struct Person {
    var name: String
    var contacts: Contects?
    
    init(name: String, email: String) {
        self.name = name
        contacts = Contects(email: ["home": email], address: "Seoul")
    }
    
    func getContacts() -> Contects? {
        return contacts
    }
}


var p = Person(name: "James", email: "swift@example.com")
let a = p.contacts?.address
type(of: a)

var optionalP: Person? = Person(name: "James", email: "swift@example.com")
// optionalP 에 인스턴스가 저장되어 있다면, 이어지는 contacts 속성에 접근하고
// 반대로 nil 이 저장되어 있다면, nil 을 리턴하고 바로 종료
let b = optionalP?.contacts?.address
type(of: b)

optionalP = nil
let c = optionalP?.contacts?.address
type(of: c)

// 리턴 형식은 마지막 표현식에 따라서 결정됨!

// Optional 형식으로 선언되어 있는 값을 통해서 속성이나 메소드를 호출할 때는 ?를 반드시 붙여야 함
// p.contacts?.address.count - 에러
p.contacts?.address?.count

// 메소드가 Optional 타입을 리턴하고 이 타입을 통해 다른 멤버에 접근할 때는 항상 () 뒤에 ? 추가
p.getContacts()?.address

// 함수 자체가 Optional 인 경우 함수 이름 뒤에 (즉, () 앞에) ? 를 붙임
let f: (() -> Contects?)? = p.getContacts
f?()?.address

// () = void 값을 리턴하지 않음
let d = p.getContacts()?.printAddress()
type(of: d)

if p.getContacts()?.printAddress() != nil {
    
}

if let _ = p.getContacts()?.printAddress() {
    // printAddress() 함수가 호출된 경우에 바인딩이 성공해서 실행
}

let e = p.contacts?.email?["home"]
p.contacts?.email?["home"]?.count

// 최종 속성까지 접근했다면 값을 저장하고 중간에 끝나면 변화가 없음
p.contacts?.address = "Daegu"
p.contacts?.address

optionalP?.contacts?.address = "Daegu"
optionalP?.contacts?.address
