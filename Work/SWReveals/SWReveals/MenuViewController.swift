//
//  MenuViewController.swift
//  SWReveals
//
//  Created by SOL iOS Mac Mini on 7/8/19.
//  Copyright © 2019 com.siliconorchard. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewHere: UITableView!
    var menuOption = ["Home","Profile","Orders","Settings"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuTVCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTVCell
        
       cell.label.text = menuOption[indexPath.row]
        return cell
    }

}
