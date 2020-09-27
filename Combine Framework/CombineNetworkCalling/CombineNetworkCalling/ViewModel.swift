//
//  ViewModel.swift
//  CombineNetworkCalling
//
//  Created by Sharetrip-iOS on 27/09/2020.
//  Copyright © 2020 AP. All rights reserved.
//

import Foundation
import Combine

//View Model
class UserViewModel {

    private let apiManager: APIManager
    private let endpoint: EndPoint

    var usersSubject = PassthroughSubject<[User], Error>()

    init(apiManager: APIManager, endpoint: EndPoint) {
        self.apiManager = apiManager
        self.endpoint = endpoint
    }

    func fetchUser() {
        let url = URL(string: endpoint.urlString)!
        apiManager.fetchItem(url: url) { [weak self] (result: Result<[User], Error>) in
            switch result {
                case .success(let users):
                    self?.usersSubject.send(users)
                case .failure(let error):
                    self?.usersSubject.send(completion: .failure(error))
            }
        }
    }
}
