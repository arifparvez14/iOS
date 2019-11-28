//
//  ViewController.swift
//  MVVMT01
//
//  Created by SOL MAC 15 on 26/11/19.
//  Copyright © 2019 SOL MAC 15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrMovieVM = [MovieViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        
    }
    
    func getData(){
        Service.shareInstnce.getAllMovieData { (movies, error) in
            if error == nil {
                self.arrMovieVM = movies?.map({return MovieViewModel(movie: $0)}) ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovieVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let MVM = arrMovieVM[indexPath.row]
        cell.textLabel?.text = MVM.atristName ?? ""
        cell.detailTextLabel?.text = MVM.trackName ?? ""
        return cell
    }
}
