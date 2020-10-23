import UIKit

/*
 # Nested Type
 : 포함된 형식, 내포된 형식으로 형식 내부에 선언된 형식을 말합니다.
 */

class One {
    struct Two {
        enum Three {
            case a
            
            class Four {
                
            }
        }
    }
    
    var a = Two()
}

let two: One.Two = One.Two()

let four: One.Two.Three.Four = One.Two.Three.Four()

let a = One.Two.Three.a
a
