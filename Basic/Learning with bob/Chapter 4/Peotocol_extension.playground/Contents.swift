import UIKit

var str = "Hello, ProtocolExtension"

protocol Student{
    func instituteName()
    func otherInfo()
}

extension Student {
    func instituteName() {
        print("SHKSC")
    }
    func idPrefix() {
        print("ID")
    }
    func testMethod(){
        
    }
}

struct StudentOne: Student {
    func otherInfo() {
        print("Other Info")
    }
    func idPrefix() {
        print("Identity")
    }
}
StudentOne().instituteName()
StudentOne().idPrefix()
StudentOne().testMethod()
StudentOne().otherInfo()
