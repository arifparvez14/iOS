import UIKit

var str = "Hello, Delegate retain cycle"
//: design Protocol
protocol SendDataDelegate: class{
    
}
//: Design Sender/ delegator
class SendingVC {
    weak var delegate: SendDataDelegate?
    
    deinit {
        print("Delegator gone")
    }
}

//: Design Receiver/Delegate
class ReceivingVC: SendDataDelegate {
    lazy var sendingVC: SendingVC = {
        let vc = SendingVC()
        vc.delegate = self
        return vc
    }()
    
    deinit {
        print("Delegate gone")
    }
}

var receivingVC: ReceivingVC? = ReceivingVC()
receivingVC?.sendingVC
//if receivingVc didn't access sendingVC then ref can be nil
receivingVC = nil


//A weak reference allows the referencong object to becoming nil (this happens automatically when
//the referenced object is deallocated

//Based on the rule above the weak must be optional
