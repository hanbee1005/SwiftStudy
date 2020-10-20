import UIKit

/*
 # Dictionary
 : 사전과 유사한 형태로 데이터를 저장하는 collection
   (key-value 로 저장, key 는 유일한 값)
 
 - 특징
    - 정렬되지 않은 체 저장 (Unordered Collection)
    - 한 dictionary 에 저장되는 데이터 타입은 모두 동일 (Single Type)
*/

// Dictionay Literal
// 문법
// [key: value, key: value, ...]
var dict = ["A": "Apple", "B": "Banana"]
// 빈 dictionary
dict = [:]

// Dictionary Type
// 문법
// Dictionary<K, V>
// [K:V] (단축형)
let dict1: Dictionary<String, Int>
let dict2: [String:Int]

// Creating a Dictionary
let words = ["A": "Apple", "B": "Banana", "C": "City"]

let emptyDict: [String: String] = [:]
let emptyDict2 = [String:String]()
let emptyDict3 = Dictionary<String, String>()

// Inspecting a Dictionary
words.count
words.isEmpty

// Accessing Keys and Values
// key 를 통해서 값에 접근
words["A"]
words["Apple"]

let a = words["E"]  // String? 타입
// 키와 연결된 값이 있으면 그 값을 없다면 default 값을 리턴
let b = words["E", default: "Empty"]

for k in words.keys.sorted() {
    print(k)
}

for v in words.values {
    print(v)
}

// Dictionary 의 키와 값을 배열로 전환
let keys = Array(words.keys)
let values = Array(words.values)

/*
 # Dictionary 에 새로운 요소 추가, 삭제
 */

// Adding Keys and Values
// - 하나의 요소 저장
var ws = [String:String]()
ws["A"] = "Apple"
ws["B"] = "Banana"

ws.count
ws

// - 이미 딕셔너리에 있는 키에 값을 저장하면 값이 수정됨
ws["B"] = "Ball"
ws.count
ws

// - 위와 같은 작업을 메소드를 사용해서 수행
// 존재하지 않은 키와 값을 추가하면 새로운 요소 추가
// 이미 존재하는 키와 값을 추가하면 기존 키의 값을 수정
// = upsert
ws.updateValue("City", forKey: "C")
ws.updateValue("Circle", forKey: "C")

// Removing Keys and Values
ws
ws["B"] = nil

ws

// 존재하지 않은 키를 삭제하는 경우에는 아무 동작도 하지 않음
ws["Z"] = nil

// 키와 관련된 값을 삭제 후 해당 값을 리턴
ws.removeValue(forKey: "A")
ws.removeValue(forKey: "A")

// 전체 요소를 삭제하기
ws.removeAll()

/*
 # Dictionary 비교, 검색
 */

// Comparing Dictionaries
let aa = ["A": "Apple", "B": "Banana", "C": "City"]
let bb = ["A": "Apple", "C": "City", "B": "Banana"]

// 저장되어 있는 키-값이 동일한지 비교 (순서 상관 없음)
aa == bb
aa != bb

// 대소문자 구분 없이 비교하는 방법
// 아래 코드는 잘못된 코드
//aa.elementsEqual(bb) { (lhs, rhs) -> Bool in
//    return lhs.key.caseInsensitiveCompare(rhs.key) == .orderedSame && lhs.value.caseInsensitiveCompare(rhs.value) == .orderedSame
//}

// 키를 정렬한 후에 비교해야 함
let aKeys = aa.keys.sorted()
let bKeys = bb.keys.sorted()

aKeys.elementsEqual(bKeys) { (lhs, rhs) -> Bool in
    guard lhs.caseInsensitiveCompare(rhs) == .orderedSame else {
        return false
    }
    
    guard let lv = aa[lhs], let rv = bb[rhs], lv.caseInsensitiveCompare(rv) == .orderedSame else {
        return false
    }
    
    return true
}

// Finding Elements

ws = ["A": "Apple", "B": "Banana", "C": "City"]

let c: ((String, String)) -> Bool = {
    $0.0 == "B" || $0.1.contains("i")
}
ws.contains(where: c)

let r = ws.first(where: c)
r?.key
r?.value

ws.filter(c)
