import UIKit

/*----------------------
  Function add two Int
----------------------*/

func addTwoNumber(num1: Int,num2: Int) -> Int{
    return num1+num2
}
addTwoNumber(num1: 10, num2: 20)

var addFunction = addTwoNumber
addFunction(3,20)

/*------------------------------
 Use Closure to add two number
------------------------------*/

var addClosure:(Int,Int) -> Int = {(num1:Int,num2:Int) in
    return num1+num2
}
addClosure(10,10)

var addClosureTwo = {(num1:Int,num2:Int) in
    return num1+num2
}
addClosureTwo(3,5)

var addClosureThree = {(num1: Float, num2: Float) in
    num1+num2
}
addClosureThree(5.2999,3.92)

/*-----------------------
    function to closure
-----------------------*/
func callString () -> String{
    return "Hello, I'm a function"
}
callString()

let callStringWithClosure:() -> String = {() in
    return "Hello, I'm a Closure"
}
callStringWithClosure()

let callStringWithClosureTwo:() -> String = {() in
    return "Hello, I'm a Closure"
}
callStringWithClosure()

/*------------------------------
    Shorter version of closure
-------------------------------*/
let callStringWithClosureThree:() -> String = {
    "Hello I'm closure three"
}
callStringWithClosureThree()
let callStringClosureFour = {"Hello, I'm closure Four"}
callStringClosureFour()

/*------------------------------
  Return closure from function
 -------------------------------*/
//Return indirectly

func returnClosure() -> ((Int,Int) -> Int){
    return addClosure
}
let returnC = returnClosure() //Return from the addClosure return type
returnC(10,90)
returnClosure()(10,10)

//Return Directly

func returnClosureDirectly()->((Int,Int) -> Int){
    return {(num1,num2) in num1+num2}
}
let closure = returnClosureDirectly()
closure(7,12)


