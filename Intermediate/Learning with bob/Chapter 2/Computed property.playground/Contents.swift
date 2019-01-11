import UIKit
import Foundation

/*-------------------------
        Get Property
 --------------------------*/

//creat computer property
class NumberClass{
    var readNumber : Double{
        get{
            return 666
        }
    }
}
NumberClass().readNumber

//It also can done by this way
class NumberClass2{
    var readNumber: Double{
        return 777
    }
}
NumberClass2().readNumber

//value cant be modified only we can access value
//NumberClass2().readNumber = 888


/*-------------------------
        Set Property
 --------------------------*/

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
print(radius)
print(diameter)

//Finding Area
var side: Double = 100
var area: Double{
    get{
        return side * side
    }
    set{
        side = sqrt(newValue)
    }
}
area = 9
