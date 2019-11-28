//
//  MovieModel.swift
//  MVVMT01
//
//  Created by SOL MAC 15 on 26/11/19.
//  Copyright © 2019 SOL MAC 15. All rights reserved.
//

import Foundation

class MovieModel: Decodable {
    var artistName: String?
    var trackName: String?
    
    init(artistName: String, trackName: String) {
        self.artistName = artistName
        self.trackName = trackName
    }
}

class ResultModel: Decodable {
    var results = [MovieModel]()
    
    init(results: [MovieModel]) {
        self.results = results
    }
}
