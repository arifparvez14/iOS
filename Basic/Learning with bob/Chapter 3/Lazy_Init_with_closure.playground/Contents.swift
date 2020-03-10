import UIKit

//Initialize an object with a closure

//: Unconventional way
let box: UIView = {
    let view = UIView()
    return view
}()

//: Create UI Components
let buttonSize = CGRect(x: 0, y: 0, width: 100, height: 100)

//: VCOne
let firstButton = UIButton(frame: buttonSize)
firstButton.backgroundColor = .black
firstButton.titleLabel?.text = "Boss"
firstButton.titleLabel?.textColor = .white

//: VCTwo
let secondButton = UIButton(frame: buttonSize)
secondButton.backgroundColor = .black
secondButton.titleLabel?.text = "Challi"
secondButton.titleLabel?.textColor = .white

//: Create button with function
func createButton(enterTitle: String) -> UIButton {
    let button = UIButton(frame: buttonSize)
    button.backgroundColor = .black
    button.titleLabel?.text = enterTitle
    return button
}

createButton(enterTitle: "blueButton")

//: Introducing Unconventional Way
struct Human{
    init(){
        print("Born in 1993")
    }
}

//let createObj = { () -> Human in
//    let human = Human()
//    return human
//}
//let objInstance = createObj()

let createObj = { () -> Human in
    let human = Human()
    return human
}()

//: Create UIView Unconventionally
let myView = { () -> UIView in
    let view = UIView()
    view.backgroundColor = .black
    return view
}()

let myNewView: UIView = {
    let view = UIView()
    view.backgroundColor = .black
    return view
}()


//Lazy Var
class IntenseMathProblem {
    lazy var complexNumber: Int = {1 * 1}()
}
let problem = IntenseMathProblem() //no value for complexNumber
problem.complexNumber //now, complexNumber is 1

//Use of lazy
//Database operation
