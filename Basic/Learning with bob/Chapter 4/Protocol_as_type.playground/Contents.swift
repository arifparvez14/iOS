import UIKit

var str = "Protocol can be used as type"
let random: Any = [1, "String", ["123"]]

//: Design Protocol
protocol EastAsianable {
    var useChopstics: Bool {get}
    var origin: String {get}
}

extension EastAsianable {
    var useChopstics: Bool {
        return true
    }
}

//: Create Blueprint
struct Korean: EastAsianable {
    var origin: String = "Korean"
}

class Japanese: EastAsianable {
    var origin: String = "Japan"
}

class Chinese: EastAsianable {
    var origin: String = "China"
}

let eastAsians: [EastAsianable] = [Korean(), Japanese(), Chinese()]

for eastAsian in eastAsians {
    print("I'm from \(eastAsian.origin)")
}

//: Protocol met generics

protocol Sleekable {
    var price: String{ get }
}

struct Diamond: Sleekable {
    var price: String = "Very high"
}

struct Ruby: Sleekable {
    var price: String = "High"
}
struct Glass: Sleekable {
    var price: String = "Dirt Cheap"
}

func stateThePrice<T: Sleekable>(enterGem: T) {
    print("I'm expensive. In fact, I'm \(enterGem.price)")
}
stateThePrice(enterGem: Glass())
