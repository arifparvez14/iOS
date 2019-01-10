import UIKit

//Typealaise for giving our own customise name to any type

//Typealias for String
typealias Name = String
func insertName(name: Name)
{
    print(name)
}
insertName(name: "Arif")

//Function Parameter
typealias gridPoint = (Int,Int)
func enterPoint(grid: gridPoint){
    grid.0
    grid.1
}
enterPoint(grid: (1,2))



