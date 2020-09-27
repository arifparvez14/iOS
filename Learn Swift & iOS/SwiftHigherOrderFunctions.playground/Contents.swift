import Foundation


/* --- Map --- */
let numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]

var doubled = numbers.map({ (num) -> Int in
    return num * 2
})
var doubledNumbers = numbers.map{ $0 * 2}

var info = [String: String]()
info["name"] = "andrew"
info["city"] = "berlin"
info["job"] = "developer"
info["hobby"] = "computer games"

let keys = info.map{$0.key} //return array of dictionary keys
let values = info.map{$0.value} //return array of dictionary values
let result = info.map{$0} // return array of dictionary tuples

let updateKeysAndValues = info.map {($0.key.uppercased(), $0.value.capitalized)}
let updateKeysAndValuesShortForm = info.map{($0.uppercased(), $1.capitalized)}

