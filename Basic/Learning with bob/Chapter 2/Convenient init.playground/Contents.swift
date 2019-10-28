import UIKit

class Human{
    var name1: String
    var name2: String
    init(name1: String,name2:String){
        self.name1 = name1
        self.name2 = name2
    }
//convenience init initialize the designated init method
    convenience init(){
        self.init(name1: "init with no parameter",name2:"Arif")
    }
}

let bob = Human(name1: "Bob",name2: "Rob")
bob.name1
bob.name2
let rob = Human()
rob.name1
rob.name2

