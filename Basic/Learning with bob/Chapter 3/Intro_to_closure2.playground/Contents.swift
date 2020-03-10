import UIKit
var str = "Hello, Closure2"


//:## Return closure
var addWithClosures = {(num1: Int, num2: Int) in
    return num1 + num2
}
var returnString: () -> String = { () in
    "Hello"
}

/*------------- Return closure Indirectly ----------------*/
func returnClosure() -> ((Int, Int) -> Int){
    return addWithClosures
}

let returnedClosure = returnClosure()
returnedClosure(10, 10)
returnClosure()(10, 15)

/*------------- Return closure Directly ----------------*/
func returnedClosureDirectly() -> ((Int, Int) -> Int) {
    return { (num1, num2) in num1 + num2}
}
let closure = returnedClosureDirectly()
closure(2,3)

func returnedClosureDirectly2() -> ((Int, Int) -> Int) {
    return { $1 + $0 }
}
let closure2 = returnedClosureDirectly2()
closure(7,5)

//:## Pass closure
func insertClosureBlock(closureBlock: () -> String) -> String {
    return closureBlock()
}

/*------------- Pass closure Indirectly ----------------*/
let returnValue = insertClosureBlock(closureBlock: returnString)
print(returnValue)

/*------------- Pass closure Directly ----------------*/
insertClosureBlock(closureBlock: {() in return "hello"})
insertClosureBlock(closureBlock: {return "hello"})
insertClosureBlock(closureBlock: {"hello"})
