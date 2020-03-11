import UIKit

var str = "How Datasource work"
var str2 = "Communication (Backword) from SecondVC(delegate) to FirstVC(delegator)"

//: Design protocol
protocol PassDataDelegate {
    func passData(data: String) -> String
}

//: Design Delegator (Sender)
class FirstVC {
    var delegate: PassDataDelegate?
}

FirstVC().delegate?.passData(data: "Do the work")

//: Design Delegate (Receiver)
class SecondVC: PassDataDelegate {
    func passData(data: String) -> String {
        print("Sender gave me data \(data)")
        return "I'm too tired"
    }
}

//: Create Objects
let firstVC = FirstVC()
let secondVC = SecondVC()

//: Assign Delegate
firstVC.delegate = secondVC
let message = firstVC.delegate?.passData(data: "a bunch of contracts!")
print(message)
