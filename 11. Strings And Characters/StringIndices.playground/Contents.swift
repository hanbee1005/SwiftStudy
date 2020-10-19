import UIKit

/*
 # String Indices
 */

let str = "Swift"

let firstCh = str[str.startIndex]
print(firstCh)

// endIndex 는 마지막 문자 다음 인덱스를 의미
let lastCharIndex = str.index(before: str.endIndex)
let lastCh = str[lastCharIndex]
print(lastCh)

let secondeCharIndex = str.index(after: str.startIndex)
let secondCh = str[secondeCharIndex]
print(secondCh)

var thirdCharIndex = str.index(str.startIndex, offsetBy: 2)
var thirdCh = str[thirdCharIndex]
print(thirdCh)

thirdCharIndex = str.index(str.endIndex, offsetBy: -3)
thirdCh = str[thirdCharIndex]
print(thirdCh)

if thirdCharIndex < str.endIndex && thirdCharIndex >= str.startIndex {
    print("Valid Index")
}
