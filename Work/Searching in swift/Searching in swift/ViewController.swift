//
//  ViewController.swift
//  Searching in swift
//
//  Created by SOL iOS Mac Mini on 5/9/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animal = ["Tiger","Lion","Cat","Tigre"]
    var search = false
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searching = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if search {
            return searching.count
        }
        else {
            return animal.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if search {
            cell?.textLabel?.text = searching[indexPath.row]
        } else {
        cell?.textLabel?.text = animal[indexPath.row]
        }
        return cell!
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searching = animal.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        search = true
        tableView.isHidden = false
        tableView.reloadData()
        if searchText == ""{
            tableView.isHidden = true
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search = false
        searchBar.text = ""
        tableView.isHidden = true
        tableView.reloadData()
    }
}

