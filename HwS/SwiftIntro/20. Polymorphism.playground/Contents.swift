import UIKit

class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformane() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformane() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformane() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castle Studio")
var fareless = StudioAlbum(name: "Fareless", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from Dhaka", location: "New York")
var allAlbum: [Album] = [taylorSwift, fareless, iTunesLive]

for album in allAlbum {
    print(album.getPerformane())
    print(album.name)
}
