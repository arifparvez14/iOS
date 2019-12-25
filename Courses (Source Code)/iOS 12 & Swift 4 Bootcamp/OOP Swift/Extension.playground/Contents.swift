import UIKit

class A {
    var hudai: String?
    final func inA() {
        print("I'm in A")
    }
    
    func Test(val: Double) {
        print("In test in A")
    }
    
    func Test(val: Double, val2: Int) {
           print("In test double-int-arg in A")
    }
    func Test(val: Int, val2: Double) {
           print("In test int-double-arg in A")
    }
    
}

var varA = A()
varA.inA() //call function in A
varA.Test(val: 10) //passing int to double
//varA.Test(val: 'a') //passing char to double
//varA.Test(val: true) //passing bool to double
varA.Test(val: 10.5, val2: 10)
varA.Test(val: 9, val2: 11.5)


class E {
    var hudai2: String?
}

protocol B {
    var one: String? { get  }
    func test()
    func test3() ->String
    func test4() ->String
}

protocol D {
    var one: String? { get  }
    func test()
    func test2()
    func test3() ->String
    func test4() ->Int
}

class C: A, B, D{
    var one: String?
    
    //try to override final method but can't
    
    func test4() -> Int {
        return 10
    }
    
    func test4() -> String {
        return "In test - string"
    }
    
    func test() {
        print("In C class")
    }
    
    func test2() {
        
    }
    
    func test3() -> String {
        return "Multiple method implementation"
    }
    
}



class F: C{
    override func test() {
        super.test()
        print("In F class")
    }
}
