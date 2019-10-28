import UIKit

/*-------------------------
            Class
 --------------------------*/

class HumanClass {
    var name: String
    init(name: String){
        self.name = name
    }
}

var humanObj1 = HumanClass(name: "Bob")
print(humanObj1.name)

//Assign humanClassObject to new Object

var newHumanClassObject = humanObj1
print(newHumanClassObject.name)

//Changing the name for new object variable name
newHumanClassObject.name = "Bobby"
print(newHumanClassObject.name)
print(humanObj1.name) //--> name variable change for both object ref


/*-------------------------
            Struct
 --------------------------*/
struct HumanStruct{
    var name : String
    init(name:String){
        self.name = name
    }
}

var structObject = HumanStruct(name:"Bob")
print(structObject.name)

var newStructObject = structObject
newStructObject.name = "Bobby"
print(newStructObject.name)
print(structObject.name)


/*-------------------------
    Mutability Issue
 --------------------------*/
class BobClass{
    var name = "Bob"
}
let bobClass = BobClass()
bobClass.name = "Bobby"
print(bobClass.name)

//Immutable Structure
struct BobStruct{
    var name = "Bob"
}
var bobStruct = BobStruct()
bobStruct.name = "Arif" // if let bobStruct than it cant possible
print(bobStruct.name)


