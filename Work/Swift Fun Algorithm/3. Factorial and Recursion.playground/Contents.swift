import UIKit

func factorialOfValues(value: UInt) -> UInt {
    
    if value == 0 {
        return 1
    }
    
    var product: UInt = 1
    for i in 1...value {
        product = product * i
    }
    return product
}

print(factorialOfValues(value: 5))

func recursiveFactorialOfValues(value: UInt) -> UInt {
    
    if value == 0 {
        return 1
    }
    
    return value * recursiveFactorialOfValues(value: value - 1 )
}

print(recursiveFactorialOfValues(value: 6))
