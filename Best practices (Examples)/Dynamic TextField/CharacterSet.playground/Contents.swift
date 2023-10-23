import UIKit

// Creating character set

let letters = CharacterSet.letters
let digits = CharacterSet.decimalDigits
let customCharacterSet = CharacterSet(charactersIn: "!@#$%^")

//Check character contains or not

var myCharacterSet = CharacterSet(charactersIn: "aeiou")
let character: Character = "a"
if myCharacterSet.contains(character.unicodeScalars.first!) {
    print("It's a vowel!")
}

// union

let alphanumeric = letters.union(customCharacterSet)
print(alphanumeric)

var myNewCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
myCharacterSet = myNewCharacterSet.subtracting(CharacterSet(charactersIn: "aeiou"))
var myNewmmm = myNewCharacterSet.subtracting(myCharacterSet)



