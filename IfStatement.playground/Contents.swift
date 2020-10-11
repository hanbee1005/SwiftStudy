import UIKit

/*
 # if
 : 조건의 참과 거짓을 판단하고 코드를 실행
 */

// if condition {
//     statement
// }

let id = "root"
let password = "1234qwer"

if id == "root" {
    print("valid id")
}

if password == "1234qwer" {
    print("valid password")
}

if id == "root" && password == "1234qwer" {
    print("go to admin page")
}

if id != "root" || password != "1234qwer" {
    print("incorrect value")
}


// if condition {
//     statements
// } else {
//     statements
// }

if id == "root" && password == "1234qwer" {
    // 조건이 참인 경우 실행
    print("go to admin page")
} else {
    // 조건이 거짓인 경우 실행
    print("incorrect value")
}


// if condition {
//     statements
// } else if condition {
//     statements
// } else {
//     statements
// }

let num = 123

if num >= 0 {
    print("positive number or zero")
    
    if num % 2 == 0 {
        print("positive even number")
    } else {
        print("positive odd number")
    }
} else {
    print("negative number")
}

// 가장 까다로운(한정된) 조건이 위에 오고 느슨한 조건이 아래로 가도록 해야 함!
if num > 100 {
    print("positive number over 100")
} else if num > 10 {
    print("positive number over 10")
} else if num > 0 {
    print("positive number")
}
