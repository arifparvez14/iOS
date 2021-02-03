import UIKit

//If you need to simply transform a value to another value, then use map
let arrayOfInt = [1, 2, 3, 4]
let arrayOfStr = arrayOfInt.map { String($0) }
print(arrayOfStr)

//If you need to remove nil values, then use compactMap
let arrayOfIntegers = [1, 2, nil, 4]
let arrayOfStrings = arrayOfIntegers.compactMap { $0 }.map(String.init)
print(arrayOfStrings)

//If you need to flatten your result one level down, then use flatMap
let arrayOfInteger = [[1, 3, 5, nil], [2, nil, 6]]
let arrayOfString = arrayOfInteger.flatMap { $0 }.compactMap { $0 }
print(arrayOfString)



