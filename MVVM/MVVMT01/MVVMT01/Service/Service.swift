//
//  Service.swift
//  MVVMT01
//
//  Created by SOL MAC 15 on 26/11/19.
//  Copyright © 2019 SOL MAC 15. All rights reserved.
//

import Foundation

class Service: NSObject {
    
    static let shareInstnce = Service()
    var arrMovieData = [MovieModel]()
    
    func getAllMovieData(completion: @escaping ([MovieModel]?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?media=music&term=bollywood"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let err = error{
                completion(nil, err)
                print("Loading data error: \(err.localizedDescription)")
            } else {
                guard let data = data else {return}
                do{
                    let result = try JSONDecoder().decode(ResultModel.self, from: data)
                    for movie in result.results {
                        self.arrMovieData.append(MovieModel(artistName: movie.artistName ?? "", trackName: movie.trackName ?? ""))
                    }
                    completion(self.arrMovieData,nil)
                } catch let jsonErr {
                    print("json error: \(jsonErr.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}

