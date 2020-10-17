import UIKit

/*
 # Optional Pattern
 */

let a: Int? = 0
let b: Optional<Int> = 0

if a == nil {
    
}

if a == .none {
    
}

if a == 0 {
    
}

if a == .some(0) {
    
}

if let x = a {
    print(x)
}

if case .some(let x) = a {
    print(x)
}

if case let x? = a {
    print(x)
}

let list: [Int?] = [0, nil, nil, 3, nil, 5]

for item in list {
    guard let x = item else { continue }
    print(x)
}

for case let x? in list {
    print(x)
}
