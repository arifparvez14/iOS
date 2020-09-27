//
//  ViewController.swift
//  CombineNetworkCalling
//
//  Created by Sharetrip-iOS on 27/09/2020.
//  Copyright © 2020 AP. All rights reserved.
//

import UIKit
import Combine

class UsersTableViewController: UITableViewController {

    var viewModel: UserViewModel!
    var users: [User] = []
    private let apiManager = APIManager()
    private var subscriber: AnyCancellable?


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModelAndFetchUsers()
        obserViewModel()
    }

    private func setupViewModelAndFetchUsers() {
        viewModel = UserViewModel(apiManager: apiManager,endpoint: .userFetch)
        viewModel.fetchUser()
    }


    private func obserViewModel() {
        subscriber =  viewModel.usersSubject.sink(receiveCompletion: { (resultCompletion) in
            switch resultCompletion {
                case .failure(let error):
                    print(error.localizedDescription)
                default: break
            }
        }) { (users) in
            DispatchQueue.main.async {
                self.users = users
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
}



