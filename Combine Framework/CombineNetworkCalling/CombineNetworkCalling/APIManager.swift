//
//  APIManager.swift
//  CombineNetworkCalling
//
//  Created by Sharetrip-iOS on 27/09/2020.
//  Copyright © 2020 AP. All rights reserved.
//

import Foundation
import Combine

class APIManager {

    private var subscriber = Set<AnyCancellable>()

    func fetchItem<T: Decodable>(url: URL, completion: @escaping (Result<[T], Error>) -> Void) {
        URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .decode(type: [T].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { (resultComplition) in
                switch resultComplition {
                    case .failure(let error):
                        completion(.failure(error))
                    case .finished: break
                }
            }, receiveValue: { (resultArray) in
                completion(.success(resultArray))
            }).store(in: &subscriber)
    }
}

enum EndPoint {
    case userFetch
    var urlString: String {
        switch self {
            case .userFetch:
                return "https://jsonplaceholder.typicode.com/users"
        }
    }
}

//Model
struct User: Decodable {
    let id: Int
    let name: String
    let email: String
}
