import UIKit

let numbers = [1,2,4,6,8,9,11,13,16,17,20]

func linearSearch(searchElement: Int, array:[Int]) -> Bool {
    for num in array {
        if num == searchElement {
            return true
        }
    }
    return false
}
print(linearSearch(searchElement: 1, array: numbers))

func binarySearch(searchElement: Int, array:[Int]) -> Bool {
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {
        let mid = (leftIndex + rightIndex) / 2
        
        if searchElement == array[mid] {
            return true
        }
        if searchElement > array[mid] {
            leftIndex = mid + 1
        }
        if searchElement < array[mid] {
            rightIndex = mid - 1
        }
    }
    return false
}

print(binarySearch(searchElement: 21, array: numbers))

