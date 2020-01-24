import UIKit

/* A class can inherit methods, properties, and other characteristics from another class */

/*-------------------------*/
/*Inheritance & Overloading*/

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        print("Empty noise")
    }
    func Test() {
        print("Into Zero-arg method")
    }
    
    func Test(value: Int) {
        print("Into Int-arg method")
    }
}

let someVehicle = Vehicle()
someVehicle.currentSpeed = 100
print("Vehicle: \(someVehicle.description)") //100

someVehicle.Test()
someVehicle.Test(value: 10)

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.currentSpeed = 50
print("Vehicle: \(bicycle.description)") //50

/*-----------------------------------------------------------------------------*/
/* Overriding: method, property, or subscript can be override for a superclass */
/* We can access the superclass version of a method, property, or subscript by using the super prefix */
/* 'final' keyword is used to prevent overriding */

class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise()
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise() //Choo Choo




