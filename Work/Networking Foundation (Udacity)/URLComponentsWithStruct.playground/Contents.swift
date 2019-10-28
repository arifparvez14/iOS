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

struct AppStore {
    static let scheme = "https"
    static let host = "itunes.apple.com"
    static let udacityPath = "/us/app/udacity/id819700933"
    
    enum ParameterKey: String {
        case mediaType = "mt"
    }
    enum MediaType: String {
        case music = "1"
        case podcast = "2"
        case audiobook = "3"
        case tvshow = "4"
        case musicVideo = "5"
        case movie = "6"
        case ipodGame = "7"
        case mobileApps = "8"
        case ringTone = "9"
        case iTunes = "10"
    }
}

var udacityAppURL = URLComponents()
udacityAppURL.scheme = AppStore.scheme
udacityAppURL.host = AppStore.host
udacityAppURL.path = AppStore.udacityPath

udacityAppURL.queryItems = [URLQueryItem(name: AppStore.ParameterKey.mediaType.rawValue, value: AppStore.MediaType.mobileApps.rawValue)]

print(udacityAppURL)
