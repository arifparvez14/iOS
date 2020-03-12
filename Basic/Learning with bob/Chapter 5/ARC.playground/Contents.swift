import UIKit

var str = "Welcome to ARC"

class Passport {
    weak var human: Human?
    let citizenship: String
    
    init(citizenship: String) {
        self.citizenship = citizenship
        print("\(citizenship) passport generated")
    }
    
    deinit {
        print("I, paper, am gone")
    }
}

//: Design Human
class Human {
    var passport: Passport?
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) generated")
    }
    
    deinit {
        print("I, \(name), gone")
    }
}

//Passport(citizenship: "Bangladeshi") //Call deinit automatically
//var myPassport = Passport(citizenship: "The Mars") //Didn't call deinit automatically

//: Create Instance
var arif: Human? = Human(name: "Arif")
var passport: Passport? = Passport(citizenship: "Bangladeshi")

//: Deallocate
arif = nil //removeing the relationship reference, not removing the object
passport = nil //removeing the relationship reference, not removing the object

//If the reference count is zero/no relationship, the object gets purged out of the memory.


var tester: Human? = Human(name: "Xyz")
var testerPassport: Passport? = Passport(citizenship: "BD")
tester?.passport = testerPassport
testerPassport?.human = tester

//tester = nil
//testerPassport = nil
//Didn't call deinit method because of retain cycle or memory leak
//making human in passport weak can solve the problem

//Option 1
//tester = nil
//testerPassport = nil

//Option 2
testerPassport = nil
tester = nil
