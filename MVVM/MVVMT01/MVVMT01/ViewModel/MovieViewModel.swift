//
//  MovieViewModel.swift
//  MVVMT01
//
//  Created by SOL MAC 15 on 26/11/19.
//  Copyright © 2019 SOL MAC 15. All rights reserved.
//

import Foundation
class MovieViewModel {
    var atristName: String?
    var trackName: String?
    
    //DI
    
    init(movie: MovieModel) {
        self.atristName = movie.artistName
        self.trackName = movie.trackName
    }
}
