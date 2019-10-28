import UIKit

//If we have a property then we have to create an object to access that property
//If we have a type property then we dont need to create any object

/*-------------------------
        Static
 --------------------------*/
struct SomeStructure{
    static var storeProperty = "Some Value"
    static var computedProperty:Int{
        get{
            return 120
        }
        set{
            print("You have set to \(newValue) ")
        }
    }
    static func hello(){
        print("Hello")
    }
}
SomeStructure.storeProperty
SomeStructure.hello()
SomeStructure.computedProperty

/*-------------------------
   class, static & final
 --------------------------*/
//static function can't be override but class fun can

class GrandParent{
    static var numOfYear = 30
    
    static func introduce(){
        print("We are married from \(numOfYear)")
    }
    
    class func introducing(){
        print("we married from \(numOfYear)")
    }
    final func canOverride(){
        print("You can change me")
    }
}
GrandParent.introduce()
GrandParent.introducing()

class parent: GrandParent{
    override class func introducing(){
        print("I'm married from 5 years")
    }
    /*
    override  func introduce(){
        
    }
    override final func canOverride(){
        
    }*/
    //cant possible coz they are struct and final type
}






