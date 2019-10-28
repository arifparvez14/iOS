import UIKit

/*-------------------------
        Operators
 --------------------------*/

//Unary Operators
//  !true, !false

//Binary Operators
// +,-,*,/,%,+= (Remember no ++)


//Typical Else - if
let canDrink = false
if !canDrink{
    print("You may Enter")
}
else{
    print("Nooooooo")
}

//Ternary Operator
!canDrink ? print("You may Enter"):print("Noooooo")

var evenNumber = [Int]()
var oddNumber = [Int]()
for number in 1...50{
    (number % 2 == 0) ? evenNumber.append(number) : oddNumber.append(number)
}
print(evenNumber)
print(oddNumber)


//Unwrapping Optionals
var age: Int? = nil
var defaultAge: Int = 20
var finalUserAge = Int()
if age! == nil{
    finalUserAge = age!
}
else{
    finalUserAge = defaultAge
}

