import UIKit
import Foundation

var radius:Double = 10
var diameter: Double{
    get{
        return radius * 2
    }
    set{
        radius = newValue
    }
}
diameter = 30

class Blog{
    let name: String
    init?(name: String) {
        if name.isEmpty{
            return nil
        }
    self.name = name
    }
}
let ariftheDev = Blog(name: "Arif")
let realarif = ariftheDev!


