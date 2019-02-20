import UIKit

//:Design Class
class Human {
    func introduce() {
        print("Hi, I am a Human")
    }
}

//:Design Subclass
class Korean: Human {
    func singGangNamStyle() {
        print("Oppa Gangnam Style")
    }
}
let bob = Korean()
bob.introduce()
bob.singGangNamStyle()

//:Type Casting
let newBob = bob as Human //Upcasting to inherited class type
newBob.introduce()

class Japanese: Human {
    func doNinja() {
        print("Shh...")
    }
}

var name = "Bob" as Any
var number = 20 as Any

var anyArray = [name, number]

//Downcast only occure after upcasting
//downcasting -> specific

//Explicit/Force Downcasting
let newValue = anyArray[1] as! Int //normal type
//let anotherValue = anyArray[1] as! String

//Implicit Downcating
let newNewValue = anyArray[0] as? Int
let newNewNewValue = anyArray[1] as? Int

//: Grouping
let shion = Japanese()
let lee = Korean()
let kenji = Japanese()
let park = Korean()

let humans: [Human] = [shion, lee, kenji, park]

for human in humans {
    if let korean = human as? Korean {
        korean.singGangNamStyle()
    }
    if let japanese = human as? Japanese {
        japanese.doNinja()
    }
    
}
