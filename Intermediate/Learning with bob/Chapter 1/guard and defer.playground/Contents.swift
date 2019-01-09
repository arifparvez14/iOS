import UIKit

/*-------------------------
            Guard
 --------------------------*/

let carDrink = true
func checkDrinkingAge(){
    guard carDrink else{
        print("You are not allowed")
        return
    }
    print("Enjoy ur Night")
}

checkDrinkingAge()

var publicName:String? = "Arif parvez"
var publicPhoto:String? = nil
var publicAge:Int? = 20

func unwrappeOnebyOne(){
    guard let name = publicName else{
        print("Name Missing")
        return
    }
    guard let photo = publicPhoto else{
        print("Photo Missing")
        return
    }
    guard let age = publicAge else{
        print("Age Missing")
        return
    }
}

unwrappeOnebyOne()


func checkInOneLine(){
    guard let name2 = publicName, let photo2 = publicPhoto, let age2 = publicAge else{
        print("Something is missing")
        return
    }
    print("Your Name is \(name2)")
}

checkInOneLine()

/*-------------------------
            Defer
--------------------------*/

func simpleDefer(){
    defer{
        print("Chil, Later")
    }
    print("Print First")
}
simpleDefer()
