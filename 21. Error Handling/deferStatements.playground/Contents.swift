import UIKit

/*
 # defer Statements
 : defer 문은 코드의 실행을 scope 가 종료되는 시점으로 연기시킵니다. 주로 코드에서 사용했던 자원을 정리할 때 사용합니다.
 */

// 문법
// defer {
//     statements
// }

// defer 문을 호출하면 block 에 포함된 코드가 바로 실행되지는 않습니다. 대신 defer 문을 호출한 scope 의 실행이 종료될 때까지 연기됩니다.

func processFile(path: String) {
    print("1")
    let file = FileHandle(forReadingAtPath: path)
    
    // Process
    
    defer {
        print("2")
        file?.closeFile()
    }
    
    if path.hasSuffix(".jpg") {
        print("3")
        return
    }
    
    defer {
        print("5")
    }
    
    print("4")
}

// defer 문은 런타임 에러로 인해 프로그램이 비정상적으로 종료되는 경우를 제외하고는 항상 해당 scope 가 종료되는 시점에 실행됩니다.

processFile(path: "file.swift")
processFile(path: "file.jpg")

// 단순히 defer 문을 구현한다고 해서 항상 defer block 에 포함된 코드가 실행되는 것은 아닙니다. 반드시 defer 문이 호출되어야 종료 시점에 실행할 코드가 예약됩니다. 이렇게 조건에 따라 defer 문이 호출되지 않는 문제를 해결하기 위해 주로 scope 시작 지점에서 defer 문을 호출합니다.

func testDefer() {
    defer {
        print(1)
    }
    
    defer {
        print(2)
    }
    
    defer {
        print(3)
    }
}

testDefer()

// defer 문은 호출한 순서대로 코드를 예약합니다. 여기에서는 1을 출력하는 defer block 이 가장 먼저 예약됩니다. 예약된 block 이 실행될 때는 defer 문이 호출된 순서와 반대로 가장 마지막에 예약된 block 이 먼저 실행됩니다.
