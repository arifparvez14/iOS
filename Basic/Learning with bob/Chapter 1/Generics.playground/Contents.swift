import UIKit

let highSchoolGPA = [2.8,3.2,3.5,3.8,3.5]
let favoritePeople = ["Ma","Baba","Vai"]
let fevoriteNumber = [3,20]

//Worst Practices
highSchoolGPA[0]
favoritePeople[1]

//Typical Solution
func printDoubleElement(array: [Double]){
    for gpa in array{
        print(gpa)
    }
}
printDoubleElement(array: highSchoolGPA)

func printNumberElement(array: [Int]){
    for num in array{
        print(num)
    }
}
printNumberElement(array: fevoriteNumber)

//Solution with Generics
func printElement <T> (array: [T]){
    for element in array{
        print(element)
    }
}
printElement(array: highSchoolGPA)
printElement(array: favoritePeople)

