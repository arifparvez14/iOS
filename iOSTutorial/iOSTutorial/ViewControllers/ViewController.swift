//
//  ViewController.swift
//  iOSTutorial
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.prepareData()
        itemTableView.delegate = self
        itemTableView.dataSource = self
        itemTableView.register(UINib(nibName: "ItemTVCell", bundle: nil), forCellReuseIdentifier: "ItemTVCell")
        itemTableView.separatorStyle = .none
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Helper.getTopicsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTVCell", for: indexPath) as! ItemTVCell
        cell.itemNameLabel.text = Helper.getTopicName(indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ViewNavigator.navigateToView(using: self, and: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

