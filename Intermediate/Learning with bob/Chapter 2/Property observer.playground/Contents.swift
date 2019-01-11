import UIKit

//willSet: It called just before the value is stored
//didSet: It called immidiately after the value store

var myGrade: Int = 80{
    willSet{
        print("Hey somethings happend, Someone going to change the \(newValue).")
    }
    didSet{
        print("Hey somethings happend again, the value is \(oldValue)")
    }
}
myGrade = 100

//Those blocks can be written as this form
var num: Int = 70{
    willSet(newNum){
        print("About to change the value to \(newNum)")
    }
    didSet(oldNum){
        print("You have \(oldNum) now you have \(num)")
    }
}
num = 100


//step count
var totalStep: Int = 20{
    willSet{
        print("About to set total step as \(newValue)")
    }
    didSet{
        if totalStep > oldValue{
            print("Added \(totalStep - oldValue) steps")
        }
    }
}
totalStep = 50
