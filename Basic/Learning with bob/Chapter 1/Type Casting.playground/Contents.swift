import UIKit
/*-------------------------
        Type Casting
 --------------------------*/
class Human{
    func introduce(){
        print("Hi I am Human")
    }
}
class korea : Human{ //child of Human
    func singGangnamStyle(){
        print("Opa gangnam")
    }
}
class japan : Human{
    func Hansu(){
        print("Sihh...")
    }
}
let me = Human()
me.introduce()

let bob = korea()
bob.introduce()
bob.singGangnamStyle()

//Upcasting with object type
let newBob = bob as Human
newBob.introduce()

//Upcasting with normal type
var name = "bob" as Any
var number = 20 as Any


//(Force/ Explicit) Downcasting
//let newValue = anyArray[1] as ! Int
//let anotherValue = anyArray[1] as! String

//(Implicit/Safe) Downcasting
//let newValue1 = anyArray[0] as? Int
//let newValue2 = anyArray[1] as? Int


/*-------------------------
        Grouping
 --------------------------*/

let shion = korea()
let lee = japan()
let kenji = japan()
let park = korea()

let humans: [Human] = [shion as Human, lee as Human, kenji as Human, park as Human]
//or
let humans2 : [Human] = [shion, lee, kenji, park]

for human in humans {
    if let korea = human as? korea{
        korea.singGangnamStyle()
        korea.introduce()
    }
    if let japan = human as? japan{
        japan.Hansu()
        japan.introduce()
    }
}
