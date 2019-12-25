protocol PassDataDelegate {
    func passData(data: String)
}

class FirstVC {
    var delegate: PassDataDelegate?
}

FirstVC().delegate?.passData(data: "Hei it's me Arif")


class SecondVC: PassDataDelegate {
    func passData(data: String) {
        print("CEO is not good")
    }
}

let firstVC = FirstVC()
let secondVC = SecondVC()

firstVC.delegate = secondVC
  
