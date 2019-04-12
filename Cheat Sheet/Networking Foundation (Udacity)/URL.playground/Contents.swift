import UIKit

let urlString = "https://itunes.apple.com/us/app/udacity/id819700933?mt=8"
let url = URL(string: urlString)
if let url = url {
    print("URL: \(url)")
    print("Scheme:\t\t\(String(reflecting: url.scheme))")
    print("User:\t\t\(String(reflecting: url.user))")
    print("Password:\t\(String(reflecting: url.password))")
    print("Host:\t\t\(String(reflecting: url.host))")
    print("Port:\t\t\(String(reflecting: url.port))")
    print("Path:\t\t\(String(reflecting: url.path))")
    print("Query:\t\t\(String(reflecting: url.query))")
    print("Fragment:\t\(String(reflecting: url.fragment))")
}

var iTunesBaseURLString = "https://itunes.apple.com/"
var simpleURL = URL(string: iTunesBaseURLString)
simpleURL?.appendPathComponent("us")
print("simpleURL:\t\(simpleURL!)")
simpleURL?.appendPathComponent("app")
simpleURL?.appendPathComponent("udacity")
simpleURL?.appendPathComponent("id819700933")
simpleURL?.appendPathComponent("?mt=8")
print("simpleURL:\t\(simpleURL!)")
