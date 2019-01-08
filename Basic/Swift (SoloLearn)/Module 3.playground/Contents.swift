import UIKit

//Functions
//----------

var str = "Hello, playground"
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currMin = array[0]
    var currMax = array[0]
    for value in array[1..<array.count] {
        if value < currMin {
            currMin = value
        } else if value > currMax {
            currMax = value
        }
    }
    return (currMin, currMax)
}

let bounds = minMax(array: [4, -4, 1, 88, 7, 42])
print("min is \(bounds.min) and max is \(bounds.max)")

//Function parameters have both an external parameter name and a local parameter name.
//The external parameter name is used to label arguments that are passed to a function call.
//A local parameter name is used as the function is implemented.

func sayHello(to p1: String, and p2: String) -> String { //(extarnal_name local_name: type)
    return "Hello \(p1) and \(p2)!"
}
print(sayHello(to: "Tom", and: "Jerry"))

//Adding a value after a function parameter's type defines a default
// value for the parameter the default value of p1 is 12
func someFunction(p1: Int = 12) {
}
someFunction(p1: 6) // p1 is 6
someFunction() // p1 is 12


//Variadic parameters indicate that the number of input values of a specified type passed to the parameter can vary. The variadic parameter can accept zero and/or more parameters of a certain type, and is indicated by adding three period characters (...) immediately following the parameter's type name.

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return (total / Double(numbers.count))
}
print(arithmeticMean(numbers: 3.3, 4.4, 6.6))

// If you want a function to modify a parameter's value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.

func swapInts(a: inout Int, b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}
var a = 5
var b = 6
print("Before swap: a is \(a) and b is \(b)")
swapInts(a: &a, b: &b)
print("After swap: a is \(a) and b is \(b)")

//define a constant or a variable to be of a function type. Then assign an appropriate function to that variable:
func addInts(a: Int, b: Int) -> Int {
    return a + b
}
var mathFunction: (Int, Int) -> Int = addInts
print(addInts(a: 2, b: 3))
print(mathFunction(5, 6))

//function type as parameter type

func addInts2(a: Int, b: Int) -> Int {
    return a + b
}

func printResult(mathFunc: (Int, Int) -> Int, a: Int, b: Int) {
    print("Result: \(mathFunc(a, b))")
}
printResult(mathFunc: addInts(a:b:), a: 3, b: 5)

//Function Type as return type

func plus(input: Int) -> Int {
    return input + 1
}
func minus(input: Int) -> Int {
    return input - 1
}
func chooseFunc(flag: Bool) -> (Int) -> Int {
    if(flag) {
        return plus
    }
    else {
        return minus
    }
}
var f = chooseFunc(flag: false)
print(f(42))

//Nested function
func chooseFunc2(flag: Bool) -> (Int) -> Int {
    func plus(input: Int) -> Int { return input + 1 }
    func minus(input: Int) -> Int { return input - 1 }
    if(flag) {
        return plus
    }
    else {
        return minus
    }
}
print(chooseFunc2(flag: true)(42))

//Recursion

func fact(n:Int) -> Int{
    return n == 0 ? 1 : n * fact(n: n-1)
}
print(fact(n : 5))

func fib(n: Int) -> Int {
    return n < 2 ? n : (fib(n: n-1) + fib(n: n-2))
}
print(fib(n: 3))

//Closures
//A Closure is a self-contained block of functionality that can be passed around and used in your code.

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
let names = ["Cc", "Aa", "Ee", "Bb", "Dd"]
print(names)
var reversed = names.sorted(by: backwards)
print(reversed)

//simple closure
//{ (parameters) -> return type in
//    statements
//}

func backwards2(s1: String, s2: String) -> Bool {
    return s1 < s2
}
let names2 = ["Cc", "Aa", "Ee", "Bb", "Dd"]
print(names2)
var reversed2 = names2.sorted(by: backwards2)
print(reversed2)

//Inline clouser
let names3 = ["Cc", "Aa", "Ee", "Bb", "Dd"]
var reversed3 = names3.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
