import UIKit

/*
 # Identity Operators
 : 항등 연산자
 */

// 동일성 비교 방식
// Value Type: 값 형식이 저장되는 메모리 공간은 stack 입니다. 하나의 공간에 저장되기 때문에 이 값을 비교하기 위해서는 비교 연산자 하나로 충분
// Reference Type: 참조 형식은 값을 heap 에 저장하고 메모리 주소를 stack 에 저장합니다. 두 개의 공간에 저장되기 때문에 비교하는 방법도 2가지가 필요합니다. 값을 비교할 때는 값 형식과 마찬가지로 비교 연산자를 사용합니다. 반면 메모리 공간을 비교할 때는 항등 연산자가 필요합니다.

// 문법
// classInstance === classInstance
// classInstance !== classInstance
// === : Identical to Operator 인스턴스의 주소가 같으면 true
// !== : Not Identical to Operator 인스턴스의 주소가 다르면 true

class A {
    
}

let a = A()
let b = a
let c = A()

a === b
a !== b

a === c
a !== c
