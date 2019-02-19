import UIKit
import Foundation

//Design ERROR (1/3)
enum HeightError: Error {
    case maxHeight
    case minHeight
}

//call Function (2/3)
func checkHeightError(height: Int) throws {
    if height > 200 {
        throw HeightError.maxHeight
    }
    else if height < 140 {
        throw HeightError.minHeight
    }
    else {
        print("No Error")
    }
}

//Handle With Error (3/3)
do{
    try checkHeightError(height: 100)
}catch HeightError.maxHeight {
    print("You are too tall")
}catch HeightError.minHeight {
    print("You are too short")
}


enum NameError: Error {
    case noName
}

//Design Class
class Course {
    var name: String
    
    init( name: String) throws {
        if name == "" {
            throw NameError.noName
        } else {
            self.name = name
            print("Hey, You're created an object")
        }
    }
}
do{
    let myCourse = try Course(name: "Arif")
}catch NameError.noName {
    print("Make Sure we Created an Object")
}

//'try?', 'try!' and 'try'
let newCourse = try? Course(name: "Arif the Boss")
let myCourseName = try!Course(name: "Arif the challi")
//let myCourseName = try!Course(name: " ") It will make error
