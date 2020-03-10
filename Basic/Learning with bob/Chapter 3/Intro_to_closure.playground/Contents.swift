import UIKit
var str = "Hello, Closure"

/*------------Function----------------*/
func addTwoNumbers(num1: Int, num2: Int) -> Int{
    return num1 + num2
}
addTwoNumbers(num1: 10, num2: 20)


var addFunction = addTwoNumbers
addFunction(10,20)


/*------------Your First Closure----------------*/
var addClosures: (Int, Int) -> Int = { (num1: Int, num2: Int) in
    return num1 + num2
}
addClosures(10,10)

/*------------Lets remove the type----------------*/
var addClosures2 = { (num1: Int, num2: Int) in
    return num1 + num2
}
addClosures2(10,10)

/*------------Lets remove the return part----------------*/
var addClosures3 = { (num1: Int, num2: Int) in num1 + num2 }
addClosures3(10,10)

/*------------Lets remove the parameter & return ----------------*/
var addClosures4: (Int, Int) -> Int = { $0 + $1 }
addClosures4(10,10)

/*------------Lets sees some short example ----------------*/
let callStringWithClosure: () -> String = { () in
    print("Hello!")
    return "I'm from closure"
}
callStringWithClosure()

/*------------ When closure contain only a single element ----------------*/
let callStringWithClosure2: () -> String = { () in "I'm from closure 2"
}
callStringWithClosure2()

/*------------We can skip in too ----------------*/
let callStringWithClosure3: () -> String = { "I'm from closure 3"
}
callStringWithClosure3()

/*------------Most sorted version of closure ----------------*/
let callStringWithClosure4 = { "I'm from closure 4"
}
callStringWithClosure4()
