
import UIKit

var str = "Hello, playground"
var myVariable = "Arif"
print(myVariable)
print("My Name is: \(myVariable)")
"Hello, " + "world"  // equals "Hello, world"
var a = 22
var b = 10
a % b
a - (a/b) * b

//=== [Indicate that object reference both refer to the same object instance]
//!== [Object reference both not refer to the same object instance]

//conditional operator
var gender = 1
gender == 0 ? print("Male"):print("Female")

//closed range operator....Include all from 1 to 3
1...3
//Half range operator....Include all from 1 and less than 3
1..<3

//Optinals -> only for Int variable in swift
//question mark indicates that it might contain some Int value, or it might contain no value at all.
var myCode: Int? = 404
print(myCode)
myCode = nil
print(myCode)
