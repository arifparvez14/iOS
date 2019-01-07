import UIKit

var str = "Hello, playground"

let number = 8

switch number {
case 0:
    print("not a valid distance")
case 1,2,3,4,5:
    print("near")
case 6...100:
    print("far")
default:
    print("too far")
}

//The three switch cases declare placeholder constants x and y, which temporarily take on the two values from myPoint, creating a dynamic filter as part of a where clause. The switch case matches the current value of point only if the where clause's condition evaluates to true for that value.

let myPoint = (1, 1)
switch myPoint{
case let(x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//Fallthrough
//Surely execute the next switch case
let myInt = 5
var desc = "The number \(myInt) is"
switch myInt {
case 2, 3, 5, 7, 11, 13, 17, 19:
    desc += " a prime number, and also"
    fallthrough
case 20:
    desc += " an integer 1."
default:
    desc += " an integer 2."
}
print(desc)

//String//
//-----------

var firstName = ""
var lastName = "Arif Parvez"
print(firstName)
print(lastName)

if firstName.isEmpty{
    print("Yes")
}

var str1 = "Arif"
var str2 = "Parvez"
print(str1 + str2) //Concatanate
str1 += "ul Islam " //additional assignment operator
print(str1 + str2)

//String interpolation includes the values of a mix of constants, variables, literals, and expressions inside a string literal to form a new String value. Prefix each item with a backslash, place the item in parentheses, and insert it into the string literal.

let mult = 4
let message = "\(mult) times 1.5 is \(Double(mult) * 1.5)" //interpolation
print(message)

let someString = "I am learning with SoloLearn"
print("someString has \(someString.count) characters") //Count character

var s1 = "Arif Parvez"
var s2 = "Tarif"
if(s1 == s2){ //"==" use for string and character Equality
    print("Equal")
}
else{
    print("Not Equal")
}

if(s1.hasPrefix("A")){ //Checking prefix for a specific pattern
    print("Same prefix")
}

if (s2.hasSuffix("f")){ //Checking suffix for a specific pattern
    print("Same Suffix")
}

//  Array
//-----

var ar = [Int]() //Initialize an empty array
var four = [Double](repeating: 0.0, count: 4) // Initializing with a default value with a number
var ar2:[String] = ["Arif","Oishi"] //Initializing with specific type
var ar3 = ["Saif","Sauda","USA","BD","Michigan"] //Type isen't mendatory cause swift will understand it

print("The shopping list contains \(ar2.count) items.") //count element
if ar2.isEmpty { //checking empty or not
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

ar2.append("Love") //Insert new Element by append method
ar2 += ["Immortal","forEver"] //Insert new element by additional assignment operator
print(ar2[2]) //Accesing emement using index

ar3.insert("Indiana", at: 4) // Insert this into 4th index
ar3.remove(at: 4) //Remove 4th one
ar3[1...3] = ["Bananas", "Oranges"] //Replace 1-3 value and insert two of them..length will be effected
//ar3.removeAll(),ar3.reverse(),ar3.removeFirst(),ar3.removeLast()

for item in ar3 { //Iterate over array
    print(item)
}
for (index, value) in ar3.enumerated() { //Finding item with respected value
    print("Item \(index + 1): \(value)")
}

//  Set
//---

//A set stores distinct values of the same type in a collection with no defined ordering. Sets are used as an alternative to arrays when item order is not a concern or when you need to ensure that an item appears only once.

var letters = Set<Character>() //Initialize an empty set
var names: Set<String> = ["David", "Susan", "Robert"] //Initialize a set with three values
var names2:Set = ["Arif","Udoy","Mehedy"] //Type isent mandatory for initialization

//The count and isEmpty properties work the same way with a set as they do with an array.
names.insert("Jisan") //Insert new Element
names2.remove("Mehedy") //Remove an element
// names.removeFirst(), names.removeAll(), names.reversed()

if names.contains("James") { //Check any contains element
    print("James is here.")
} else {
    print("James is not with us.")
}

for name in names {
    print("\(name)")
}
for name in names.sorted() {
    print("\(name)")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
oddDigits.intersection(evenDigits).sorted() //creates a new set, with only the values common to both sets
oddDigits.symmetricDifference(evenDigits).sorted() //creates a new set with values in either set, but not both.
oddDigits.union(evenDigits).sorted() //creates a new set with all of the values in both sets.
oddDigits.subtracting(evenDigits).sorted() //creates a new set with values not in the specified set.

//"is equal" operator (==): Determines whether two sets contain all of the same values.
//isSubset(of: ) method: Determines whether all of the values of a set are contained in the specified set.
//isSuperset(of: ) method: Determines whether a set contains all of the values in a specified set.
//isStrictSubset(of: ) or sStrictSuperset(of: ) method: Determines whether a set is a subset or superset of, but not equal to, a specified set.
//isDisjoint(with: ) method: determines whether two sets have any values in common.

var airports = [Int: String]() //Declare with key-value [int-string]
var airports2: [String: String] = ["TOR": "Toronto", "NY": "New York"]
var airports3 = ["TOR": "Toronto", "NY": "New York"]
//airports["LHR"] = "London" //assign value
//airports["LHR"] = "London Heathrow"//Edit value
//let oldValue = airports.updateValue("New York", forKey: "NY") //update value
//let airportName = airports["NY"] //retreive value
//airports["APL"] = "Apple"
//airports["APL"] = nil

//for (airportCode, airportName) in airports { //Iterate ovr all value
//print("\(airportCode): \(airportName)")
//}

for airportCode in airports.keys { //find keys
    print("Airport code: \(airportCode)")
}

for airportName in airports.values { //find values
    print("Airport name: \(airportName)")
}



