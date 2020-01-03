import UIKit

//Function and closure: same old, same old
func foo(x:Int) -> Int {
    return 42 + x
}

let bar = {(x: Int) -> Int in 42 + x}

//create a few function, add them to an array and call them
func curly(n: Int) -> Int {
    return n*n
}

func larry(x: Int) -> Int {
    return x * (x+1)
}

func moe(m:Int) -> Int {
    return m*(m-1)*(m-2)
}

var stooges = [curly,larry,moe]
stooges.append(bar)

for s in stooges {
    s(42)
}
