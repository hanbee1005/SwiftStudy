import UIKit

/*
 # String Interpolation
 : 문자열 삽입
 - 문법: /(expr)
 */

var str = "12.34KB"

let size = 12.34
// str = size + "KB"
str = String(size) + "KB"
str = "\(size)KB"

// 원하는 format을 직접 지정할 수는 없음

/*
 # Format Specifier
 : 포맷 지정자
 - 문법: %char
 */

// .1 은 소수점 한자리까지만
// f 는 실수를 의미함
str = String(format: "%.1fKB", size)

// @: 문자열 대체
String(format: "Hello, %@", "Swift")
// d: 정수 대체
String(format: "%d", 12)
// f: 실수 대체 (소수점 출력 범위 자동 지정)
String(format: "%010.3f", 12.34)

// 자리수를 지정 (양수: 오른쪽 정렬, 음수는 왼쪽 정렬)
String(format: "[%d]", 123)
String(format: "[%10d]", 123)
String(format: "[%-10d]", 123)

let firstName = "Yoon-ah"
let lastName = "Lim"

let korFormat = "그녀의 이름은 %2$@ %1$@ 입니다."
let engFormat = "Her name is %@ %@"

String(format: korFormat, firstName, lastName)
String(format: engFormat, firstName, lastName)

/*
 # escape sequence
 */
str = "\\"
print(str)

// \t: tab
print("A\tB")
// \n: 줄바꿈
print("C\nD")
// \", \'
print("\"Hello\" He said.")


/*
 # String Interpolation (Swift 5+)
 */

struct Size {
    var width = 0.0
    var height = 0.0
}

let s = Size(width: 1.2, height: 3.4)
print("\(s)")

// 1.2 x 3.4 출력
extension Size: CustomStringConvertible {
    var description: String {
        return "\(width) x \(height)"
    }
}
print("\(s)")

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Size) {
        appendInterpolation("\(value.width) x \(value.height)")
    }
    
    mutating func appendInterpolation(_ value: Size, style: NumberFormatter.Style) {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        
        if let width = formatter.string(for: value.width), let height = formatter.string(for: value.height) {
            appendInterpolation("\(width) x \(height)")
        } else {
            appendInterpolation("\(value.width) x \(value.height)")
        }
    }
}
print("\(s)")
print("\(s, style: .spellOut)")
