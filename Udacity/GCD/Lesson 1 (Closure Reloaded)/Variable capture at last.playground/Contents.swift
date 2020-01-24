import UIKit

typealias IntMaker = () -> Int

func makeCounter() -> IntMaker {
    var n = 0
    
    func adder() -> Int {
        n = n + 1
        return n
    }
    return adder
}

let counter1 = makeCounter()
let counter2 = makeCounter()

counter1()
counter1()
counter1()

counter2()
counter2()
