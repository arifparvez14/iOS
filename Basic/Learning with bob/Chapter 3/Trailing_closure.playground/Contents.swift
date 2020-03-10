import UIKit
var str = "Hello, Trailing Closure"

func trailingClosure(num: Int, closure: () -> Void) {
    print("You've entered \(num)")
    closure()
}

//Design Closure block
func helloFunc() -> Void {
    print("Hello, Function!")
}

let helloClosure = {
    print("Hello, Closure!")
}

// Pass closure indirectly
trailingClosure(num: 100, closure: helloFunc)
trailingClosure(num: 100, closure: helloClosure)

// Pass closure directly
trailingClosure(num: 100, closure: {print("Hello")})
trailingClosure(num: 10) {
    print("Hello from inside")
}

//Another Example
func trailingClosure2(num: Int, closure: (Int) -> Int) {
    let newNumber = closure(num)
    print(newNumber)
}

trailingClosure2(num: 1000, closure: {number in number * number})
trailingClosure2(num: 22) { (number) in return number * number}
trailingClosure2(num: 44) { (number) in number * number}
trailingClosure2(num: 400) { $0 * $0}


