import UIKit

/*
 # Array
 : 하나 이상의 데이터를 연속해서 저장하는 컬렉션
 
 - 특징
    - 배열은 항상 저장된 순서대로 정렬되어 있음 (Ordered Collection)
    - 배열에 저장하는 데이터의 타입은 항상 동일해야 함 (Single Type)
    - 값은 중복되어 저장할 수 있음
    - 요소에 접근할 때는 인덱스를 사용함 (0-based Index)
    - 중간 요소가 삭제되는 경우 뒤에 요소들이 앞으로 이동하며 자동으로 인덱스 재정렬
    - 배열 중간에 요소를 추가하는 경우 오버헤드가 발생할 수 있으니 가능하면 맨 뒤에 삽입
 */


// Array Literal
// 문법
// [elem, elem, ...]
let n = [1, 2, 3]

// Array Type
// 문법
// Array<T>
// [T] (단축형)
let strArray: Array<String>
let strArray2: [String]

// Array Basics
// - Creating an Array (배열 생성)
let numbers = [1, 2, 3]
// 빈 배열을 만들 떄는 자료형을 직접 지정해야 함
let emptyArray: [Int] = []

let emptyArray2 = Array<Int>()
let emptyArray3 = [Int]()

// 초기 값 지정해서 배열 생성하기
let zeroArray = [Int](repeating: 0, count: 10)

// - Inspecting an Array
numbers.count
numbers.count == 0
numbers.isEmpty
emptyArray.isEmpty

// - Accessing Elements
// 올바른 인덱스와 범위를 사용하는 것이 중요!
let fruits = ["Apple", "Banana", "Melon"]
fruits[0]
fruits[2]
fruits[0...1]

fruits[fruits.startIndex]
fruits[fruits.index(before: fruits.endIndex)]

fruits.first
fruits.last

emptyArray.first
emptyArray.last

// emptyArray[0] - 에러 발생
// index 보다는 속성을 사용하여 접근하는 것이 안전!

/*
 # 배열 편집하기
 */

// Adding Elements
var alphabet = ["A", "B", "C"]
// - 배열 마지막에 값 추가 (동일한 자료형만 저장 가능)
alphabet.append("D")
// - 두 개 이상의 요소를 추가할 때
alphabet.append(contentsOf: ["F", "G"])
// - 중간에 값 추가
alphabet.insert("E", at: 4)
// - 배열 시작 부분에 추가하기
alphabet.insert(contentsOf: ["a", "b", "c"], at: 0)

// insert 메소드를 사용하면 오버헤드가 발생하기 때문에 반드시 필요한 경우에만 사용!!

// Update Elements
alphabet[0...2] = ["x", "y", "z"]
alphabet

alphabet.replaceSubrange(0...2, with: ["a", "b", "c"])
alphabet

alphabet[0...2] = ["z"]
alphabet

alphabet[0..<1] = []
alphabet

// Removing Elements
// 인덱스와 배열이 비어있는지 여부 확인 중요!!
alphabet = ["A", "B", "C", "D", "E", "F", "G"]
// - 하나의 요소 삭제하고 삭제한 요소를 반환
alphabet.remove(at: 2)
alphabet
// - 첫번째 요소를 삭제 후 삭제한 요소를 반환
alphabet.removeFirst()
alphabet
// - 시작 부분의 2개의 요소를 삭제 (반환되는 값이 앖음)
alphabet.removeFirst(2)
alphabet
// - 배열에 저장된 모든 요소를 삭제
alphabet.removeAll()
// - 조금 더 안전한 메소드 (removeLast 랑 비교 시)
// 배열이 비어있는 경우에는 nil을 리턴함
alphabet.popLast()

alphabet = ["A", "B", "C", "D", "E", "F", "G"]
alphabet.popLast()
alphabet

// - 특정 범위를 삭제
alphabet.removeSubrange(0...2)
alphabet

alphabet[0...2] = []
alphabet

/*
 # 배열의 비교, 검색, 정렬
 */

// Comparing Arrays
let a = ["A", "B", "C"]
let b = ["a", "b", "c"]

// 각 배열의 개별 요소와 저장 순서를 비교
a == b
a != b

// == 와 동일
a.elementsEqual(b)

// 직접 비교 코드를 지정할 때
a.elementsEqual(b) { (lhs, rhs) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedSame
}

// Finding Elements
let nums = [1, 2, 3, 1, 4, 5, 2, 6, 7, 5, 0]
nums.contains(1)
nums.contains(8)

nums.contains { (n) -> Bool in
    return n % 2 == 0
}

// 가장 먼저 검색된 요소를 반환
nums.first { (n) -> Bool in
    return n % 2 == 0
}

// 가장 먼저 검색된 요소의 인덱스를 반환
nums.firstIndex { (n) -> Bool in
    return n % 2 == 0
}

// 가장 먼저 검색된 요소의 인덱스를 반환
nums.firstIndex(of: 1)

// 가장 마지막에 검색된 요소의 인덱스를 반환
nums.lastIndex(of: 1)

// Sorting on Array
// 정렬된 새로운 배열을 리턴하는 메소드 sorted
nums.sorted()
nums

// 내림 차순 정렬
nums.sorted { (a, b) -> Bool in
    return a > b
}
nums.sorted().reversed()
[Int](nums.sorted().reversed())

// 배열을 직접 정렬하는 메소드 sort
var mutableNums = nums
mutableNums.sort()
mutableNums.reverse()

// 특정 위치 요소 교체
mutableNums.swapAt(0, 1)

// 요소의 순서를 랜덤으로 변경
mutableNums.shuffle()
