//
//  ViewController.swift
//  PrettyIcon
//
//  Created by SOL MAC 15 on 25/1/20.
//  Copyright © 2020 SOL MAC 15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var icons = [Icon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let iconSets = IconSet.iconSets()
        let iconSet = iconSets[0]
        icons = iconSet.icons
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath)
        let icon = icons[indexPath.row]
        cell.textLabel?.text = icon.title
        cell.detailTextLabel?.text = icon.subtitle
        if let iconImage = icon.image {
            cell.imageView?.image = iconImage
        }
        return cell
    }
}

