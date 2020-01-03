import UIKit

// assign to var or constant
let f = {(x: Int) -> Int in
    return x + 42
}
f(9)
f(50)

//closure in an array (or a dictionary, or a set, etc...)
let closure = [f,
            {(x:Int) -> Int in return x * 2},
            {x in return x - 8},
            {x in x * x},
            {$0 * 42}]

for fn in closure {
    fn(42)
}

let k = {(x:Int, y:Int) -> Int in return x+y}


//Adding closure to an array
let sum = {(a: Int, b:Int) -> Int in return a+b}
let sumf = {(a: Float, b:Float) -> Float in return a+b}

let closure2 = [sum, sumf] as [Any]



