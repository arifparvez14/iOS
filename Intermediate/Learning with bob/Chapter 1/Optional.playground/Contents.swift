import UIKit

var str = "Hello, playground"
var perhaps:Int?=nil
print(perhaps)

//Force Unwrapping

var myString : String?
myString = "Hello, Swift"

if(myString != nil){
    print(myString!)
}
else{
    print("My String Has nil")
}


//Automatic Unwrapping
var newString: String!
newString = "hello"
if newString != nil{
    print(newString)
}
else{
    print("newString has nil value")
}

//Optional Binding
var name:String?
name = "My Name"
if let sname = name{
    print("Name found")
}
else {
    print("Not Found")
}
