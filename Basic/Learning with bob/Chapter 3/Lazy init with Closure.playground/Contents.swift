import UIKit

class InstenceMathProblem{
    lazy var complexNumber: Int = {
        1*1
    }()
}
let problem = InstenceMathProblem()
//print(problem.complexNumber)

class sortFormDatabase{
    lazy var sortedNumberFromDatabase : [Int] = {
        [1,2,3,4,5,6,7,8]
    }()
}
sortFormDatabase().sortedNumberFromDatabase[1]

/*---------------------
    Closure Array
 --------------------*/

var closureArray: [() -> ()] = []
var i = 0
for _ in 1...5{
    closureArray.append {
        print(i)
    }
    i += 1
}
print(closureArray[2]())


//Closure of ref type
var c = 0
var d = 0
let smartClosure:()->() = {() in
    print(c,d)
}
smartClosure()
c = 9
d = 9
smartClosure()

//Capture List
let smartClosure2 : () -> () = {[c,d] in
    print(c,d)
}
smartClosure2()
c=10
d=10
smartClosure2()















