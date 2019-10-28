import UIKit

class NuclearRocket{
    var meters: Double
    var liters: Double
    
    //init for BD
    init(meters: Double, liters: Double){
        self.meters = meters
        self.liters = liters
    }
    //init for USA
    convenience init(ft: Double, gallon: Double){
        let convertedMeters = ft / 3.28
        let convertedLiters = gallon * 3.78
        self.init(meters: convertedMeters , liters: convertedLiters)
    }
}

var rocket = NuclearRocket(meters: 20, liters: 20)
rocket.liters
rocket.meters

var newRocket = NuclearRocket(ft: 2, gallon: 3)
newRocket.meters
newRocket.liters
print("Hi")
