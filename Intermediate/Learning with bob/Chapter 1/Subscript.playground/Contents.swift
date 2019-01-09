import UIKit

//Normal Method
struct HelloKitty{
    func saySomehing() -> String{
        return "I'm Cute"
    }
}
HelloKitty().saySomehing()


//Introducing Subscript
struct WeekDays{
    var days = ["Monday", "Tuesday","Wednesday","Thursday","Friday"]
    
    subscript(index:Int) -> String{
        return days[index]
    }
}
let myDays = WeekDays()
myDays[0]


//Dicitionary type and subscript use for it
var info = ["Height":183, "Body":12.5,"Weight":76]
let height = info["Height"]

struct HealthInfo{
    var info2 = ["Height":183, "Body":12.5,"Weight":76]
    
    subscript(key:String) -> Double{
        if let newInfo = info2[key]{
            return newInfo
        }else{
            return 0
        }
    }
}

let myInfo = HealthInfo()
let newInfo = myInfo["Height"]


