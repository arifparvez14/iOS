import UIKit

let totalCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢")

let allowCharacters = CharacterSet(charactersIn: "!@#$")
let disAllowCharacters = CharacterSet(charactersIn: "%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢")

enum ValueSet {
    case allowCharacters(CharacterSet)
    case disallowCharacterSet(CharacterSet)
    case regex(String)
}

var acs = ValueSet.allowCharacters(allowCharacters)
var dcs = ValueSet.disallowCharacterSet(disAllowCharacters)


let str = "hellọ̀, playground"
let charset = CharacterSet.lowercaseLetters
let prefix = str.prefix(while: { $0.unicodeScalars.first(where: { charset.contains($0) }) != nil })
print(prefix) 




