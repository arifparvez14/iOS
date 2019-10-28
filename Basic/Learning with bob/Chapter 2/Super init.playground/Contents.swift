import UIKit

class Vehicle{
    var description: String{
        return "I'm moving at 30km/h"
    }
    func warning(){
        print("Be careful i'm going pretty fast")
    }
}

class Toycar: Vehicle{
    override var description: String{
        return "\(super.description) Hey, but i'm small though"
    }
    override func warning() {
        print("Dont mond me")
        super.warning()
    }
}
print(Toycar().description)
print(Toycar().warning())


//Super Init
class Human{
    var origin: String
    init(enterOrigin: String){
        origin = enterOrigin
    }
}

Human(enterOrigin: "Arif")

class Korean: Human{
    var city: String
    
    init(enterCity: String){
        city = enterCity
        super.init(enterOrigin: "Republic of BD")
    }
    init(enterCity: String, origin: String){
        self.city = "Dhaka"
        super.init(enterOrigin: origin)
    }
}
let bob = Korean(enterCity: "Tangail")
bob.city
bob.origin

let user = Korean(enterCity: "Narshindi",origin: "Kolkata")
user.city
user.origin

//see carefully
class Tesla{
    var numberOfWheels: Int
    init(enterWheelNumber: Int){
        numberOfWheels = enterWheelNumber
    }
}
class ModelS: Tesla{
    override init(enterWheelNumber: Int){
        super.init(enterWheelNumber: enterWheelNumber)
        print("This is a beautiful car")
    }
}
let myCar = ModelS(enterWheelNumber: 50)
myCar.numberOfWheels
