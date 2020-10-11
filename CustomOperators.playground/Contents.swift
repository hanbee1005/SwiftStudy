import UIKit

/*
 # Custom Operators
 */

// 1. 연산자를 가능한 단순한 형태로 선언해야 한다.
// 2. 기존에 있는 연산자와 함께 사용했을 때 모호함이 없도록 선언해야 한다.

// prefix operator operator
// postfix operator operator
// infix operator operator

// Reserved Tokens
// 단독으로 사용 불가
// (, ), {, }, [, ], ., ,, :, ;, =, @, #, &(prefix operator), ->, `, ?, !(postfix operator)

// First Character
// /, =, -, +, !, *, %, <, >, &, |, ^, ?, ~

// static prefix func operator(parameters) -> ReturnType {
//      statements
// }

// static postfix func operator(parameters) -> ReturnType {
//      statements
// }

// static func operator(parameters) -> ReturnType {
//      statements
// }

prefix operator +++

extension Int {
    static prefix func +++(num: inout Int) {
        num += 2
    }
}

var a = 1
+++a

precedencegroup MyPrecedence {
    higherThan: AdditionPrecedence
}

infix operator *+*: MyPrecedence

extension Int {
    static func *+*(left: Int, right: Int) -> Int {
        return (left * right) + (left * right)
    }
}

1 *+* 2 + 3

// + - : AdditionPrecedence Group
// * / : MultiplicationPrecedence Group
// < <= > >= == != : ComparisionPresedence Group
// = += -= *= /= : AssignmentPresedence Group

// infix operator operator: PrecedenceGroup
// precedencegroup Name {
//      higherThan: LowerGroupName
//      lowerThan: HigherGroupName
//      associativity: associativity
// }
