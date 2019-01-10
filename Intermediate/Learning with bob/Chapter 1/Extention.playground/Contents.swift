import UIKit

struct Bob{
    var name = "Bob"
    var skill = "Work"
    init(name: String, skill: String){
        self.name = name
        self.skill = skill
    }
}
//Bob().name
//let newBob = Bob()

extension Bob{
    var description: String{
        let myName = self.name
        let mySkill = self.skill
        return "I m \(myName). I know \(mySkill)"
    }
}
let bob = Bob(name: "Arif",skill: "Code")
print(bob.description)


//Extension of Swift type

let number = 0
extension Int{
    var squared: Int{
        return self*self
    }
}
Int(123).squared
123123.squared
