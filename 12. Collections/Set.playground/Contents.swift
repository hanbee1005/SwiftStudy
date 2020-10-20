import UIKit

/*
 # Set
 
 - 정렬 순서보다 검색 속도가 중요한 경우 배열 대신 사용 (Hashing 알고리즘 사용)
 - 정렬되지 않으며 인덱스를 사용하지도 않음 (Unordered Collection)
 - 동일한 형식의 요소를 저장함 (Single Type)
 - 동일한 값을 하나만 저장, 중복 불가 (Single Unique Value)
 */

// Set Literal
// 배열과 동일한 리터럴을 사용함
let setLiteral = [1, 2, 2, 3, 3, 3]
// 형식 추론에서는 항상 Array 로 추론됨
setLiteral.count

// Set Type
// 문법
// Set<T>
// 초기 값을 입력하는 경우 <T> 는 생략 가능
let set: Set<Int> = [1, 2, 2, 3, 3, 3]
set.count

// Inspecting a Set
set.count
set.isEmpty

// Testing for Membership
// 요소가 포함되어 있는지 확인
set.contains(1)

// Adding and Removing Elements
var words = Set<String>()

// - 요소를 추가하고 결과를 튜플로 리턴함 (요소 추가 결과, 추가된 요소)
var insertResult = words.insert("Swift")
insertResult.inserted
insertResult.memberAfterInsert

insertResult = words.insert("Swift")
insertResult.inserted
insertResult.memberAfterInsert

// upsert 방식으로 동작, 작업의 결과를 String? 으로 리턴
var updateResult = words.update(with: "Swift")
updateResult

updateResult = words.update(with: "Apple")
updateResult

var value = "Swift"
value.hashValue // Hash 값 확인

updateResult = words.update(with: value)
updateResult

value = "Hello"
value.hashValue

updateResult = words.update(with: value)
updateResult

// Set 은 Hash 값이 다르면 다른 문자로 인식하고 처리함

// Hash 값이 같은 경우 어떻게 처리되는지
struct SampleData: Hashable {
    var hashValue: Int = 123
    var data: String
    
    init(_ data: String) {
        self.data = data
    }
    
    static func ==(lhs: SampleData, rhs: SampleData) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

var sampleSet = Set<SampleData>()

var data = SampleData("Swift")
data.hashValue

var r = sampleSet.insert(data)
r.inserted
r.memberAfterInsert
sampleSet

data.data = "Hello"
data.hashValue

r = sampleSet.insert(data)
r.inserted
r.memberAfterInsert
sampleSet

sampleSet.update(with: data)
sampleSet

words
words.remove("Swift")
words

words.remove("Ghost")

words.removeAll()
words

/*
 # Set 을 비교하고 집합 연산 구현
 */

// Comparing Sets
var a: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var b: Set = [1, 3, 5, 7, 9]
var c: Set = [2, 4, 6, 8, 10]
let d: Set = [1, 7, 5, 9, 3]

a == b
a != b

b == d

// 두 컬랙션에 저장된 요소를 순서대로 비교하므로 결과는 실행할 때마다 다름
b.elementsEqual(d)

// 집합 비교
// 부분 집합 비교
a.isSubset(of: a)
a.isStrictSubset(of: a)

b.isSubset(of: a)
b.isStrictSubset(of: a)

d.isSubset(of: a)
d.isStrictSubset(of: a)

// 상위 집합 비교
a.isSuperset(of: a)
a.isStrictSuperset(of: a)

a.isSuperset(of: b)
a.isStrictSuperset(of: b)

a.isSuperset(of: c)
a.isStrictSuperset(of: c)

// 교집합 확인
// 교집합 = false, 서로소 집합 = true
a.isDisjoint(with: b)
a.isDisjoint(with: c)
b.isDisjoint(with: c)

// Combining Sets
// 집합 연산
a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

// 합집합 구하기
var result = b.union(c)
result = b.union(a)

b.formUnion(c) // 직접 b set 을 변경함
b

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

// 교집합 구하기
result = a.intersection(b)
result = c.intersection(b)

// 원본을 변경하는 교집합 구하기
a.formIntersection(b)
a

b.formIntersection(c)
b

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

// 여집합 구하기
result = a.symmetricDifference(b)
result = c.symmetricDifference(b)

a.formSymmetricDifference(b)

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [1, 3, 5, 7, 9]
c = [2, 4, 6, 8, 10]

// 차집합 구하기
result = a.subtracting(b)
a.subtract(b) // 원본 set 변경하기
