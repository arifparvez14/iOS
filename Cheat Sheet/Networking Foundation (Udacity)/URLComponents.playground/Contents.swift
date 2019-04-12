import UIKit
import Foundation

let urlString = "https://itunes.apple.com/us/app/udacity/id819700933?mt=8"
let url = URLComponents(string: urlString)

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

var udacityAppURL = URLComponents()
udacityAppURL.scheme = "https"
udacityAppURL.host = "itunes.apple.com"
udacityAppURL.path = "/us/app/udacity/id819700933"
udacityAppURL.queryItems = [URLQueryItem(name: "mt", value: "8")]
print(udacityAppURL)


