import UIKit

class Human{
    var name:String
    init(name:String)
    {
        self.name = name
    }
    func sayHello(){
        print("Hello, I'm \(name)")
    }
}
class Apartment{
    var human : Human?
    
}

//Initialize

var dhakaApartment = Apartment()
dhakaApartment.human = Human(name: "Arif")
dhakaApartment.human?.sayHello()

//Force Unwrapping

dhakaApartment.human!.name

//Impicit Unwrapping

var tanApartment = Apartment()
if let name2 = tanApartment.human?.name{
        print("Name Found")
}
else{
    print("Not Found")
}




