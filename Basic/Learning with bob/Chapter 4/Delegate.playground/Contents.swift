import UIKit

var str = "How delegate work"
var str2 = "Simply pass data between object, Unidirectional communication"

//Send data from FirstVC(CEO) aka delegator to SecondVc (Secratery) aka delegate.

//: Design protocol
protocol PassDataDelegate {
    func passData(data: String)
}

//: Design Delegator (Sender)
class FirstVC {
    var delegate: PassDataDelegate?
}

FirstVC().delegate?.passData(data: "Do the work")

//: Design Delegate (Receiver)
class SecondVC: PassDataDelegate {
    func passData(data: String) {
        print("Somethings happend, \(data)")
    }
}

//: Create Objects
let firstVC = FirstVC()
let secondVC = SecondVC()

//: Assign Delegate
firstVC.delegate = secondVC
firstVC.delegate?.passData(data: "a bunch of contracts!")
