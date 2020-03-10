import UIKit

var str = "Hello, CaptureList"

var a = 0
var b = 0

let newClosure = {print(a,b)}
newClosure()

//Design Closure Array

var closureArray: [() -> ()] = []
var i = 0

for _ in 1...5 {
    closureArray.append {
        print(i)
    }
    i += 1
}

//closureArray[0]()
//Closure are like classes

var c = 0
var d = 0

let smartClosure: () -> () = { () in
    print(c, d)
}

smartClosure()

c = 9
d = 9
smartClosure() //(9, 9)

//Capture List

let smarterClosure: () -> () = { [c, d] in
    print(c, d)
}

smarterClosure() // (9, 9)

c = 10
d = 10

smarterClosure() // (9, 9)


//Design closure
var smartClosureArray: [() -> ()] = []
var j = 0

//Append Closure
for _ in 1...5 {
    smartClosureArray.append { [j] in
        print(j)
    }
    j += 1
}

smartClosureArray[0]()
