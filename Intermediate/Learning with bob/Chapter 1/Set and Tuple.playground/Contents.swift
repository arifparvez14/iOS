import UIKit

/*-------------------------
            Array
 --------------------------*/
//Multiple way to create an array

var arrayOne :[Double] = []
var arrayTwo = [Double]()
var arrayThree : Array <Double> = []
var arrayFour : Array <Double> = Array()
var arrayFive = Array([11.23,12.84])
var arraySix = Array(1...50)
var arraySeven = Array(repeatElement("Bob", count: 10))

//Multiple way to create a Set

var setOne: Set = [1,2,3,4,5,1,2,3,4,5,1,1,1]
var setTwo: Set<String> = ["Bob","Arif","Dev"]
var setThree = Set<String>()
var setFour = Set(["Arif","Saif","Sauda"])

//Built-in set Method

setThree.insert("Arif")
setThree.contains("saif")
setThree.remove("saif")

//Generate odd and even

var oddNumber : [Int] = []
var evenNumber : [Int] = []
for number in 1...50{
    if number % 2 == 0 {
        evenNumber.append(number)
    }
    else{
        oddNumber.append(number)
    }
}

//Convert array into set
var oddNumberSet = Set(oddNumber)
var evenNumberSet = Set(evenNumber)


//Different Set Operation
print(oddNumberSet.union(evenNumberSet))
print(oddNumberSet.symmetricDifference(evenNumberSet))
print(oddNumberSet.intersection(evenNumberSet))
print(oddNumberSet.subtract(evenNumberSet))

let numberSet1 = Set([1,2,3])
let numberSet2 = Set([1,2])
//print(numberSet1.subtract(numberSet2))
//   ERROR   //
//Set is struct type so we not allowed to mean to do subtract


//Filter/Sort
//**Convert sets to sorted array

let sortedArray = evenNumberSet.sorted()
print(sortedArray)



/*-------------------------
            Tuples
 --------------------------*/

let firstScore = (name: "Bob",score:9)
firstScore.0
firstScore.1

firstScore.name
firstScore.score

//Practical Usages
let httpSuccess = (code:200, description:"success")
httpSuccess.code

//Bonus Tips
var dog = "dog", cat = "cat"
print(dog)
var (x,y,z) = (1,2,3)
print(x)
print(y)

//enumerated() create internal tuples to acces index values

var shoppingList = ["Egg","Milk","Rice"]
for (index, value) in shoppingList.enumerated(){
    shoppingList.index(before: 1)
}







