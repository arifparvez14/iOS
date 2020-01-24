import UIKit

/*Initialization is the process of preparing an instance of a class, structure, or enumeration for use*/
/*This process involves setting an initial value for each stored property on that instance and performing setup or initialization that is required before the new instance is ready for use*/

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit") //32.0

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0) //100
let freezingPointOfWater = Celsius(fromKelvin: 273.15) //0.0
let bodyTemperatire = Celsius(10.5)

/* Oprtional Property type*/
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."

/* Memberwise initiaization for struct */
// A default memberwise initializer for structure is given by swift
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
let zeroByTwo = Size(height: 2.0) //0.0, 2.0
let zeroByZero = Size() // 0.0, 0.0

/* Designated Initializers and Convenience Initializers */
// Designated initializers are the primary initializers for a class which fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.
//Convenience initializers are secondary, supporting initializers for a class. You can define a convenience initializer to call a designated initializer from the same class.

/* Initialize Delegation for Class Type */
//Rule 1: A designated initializer must call a designated initializer from its immediate superclass.
//Rule 2: A convenience initializer must call another initializer from the same class.
//Rule 3: A convenience initializer must ultimately call a designated initializer.
