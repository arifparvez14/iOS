//
//  ViewController.swift
//  DynamicTV
//
//  Created by SOL MAC 15 on 15/1/20.
//  Copyright © 2020 SOL MAC 15. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var demoTV: UITableView!
    @IBOutlet var containerView: UIView!
    var item = ["A","B","C"]
    override func viewDidLoad() {
        super.viewDidLoad()
        demoTV.delegate = self
        demoTV.dataSource = self
        let nib = UINib(nibName: "demoTVCell", bundle: nil)
        demoTV.register(nib, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        demoTV.frame = CGRect(x: demoTV.frame.origin.x, y: demoTV.frame.origin.y, width: demoTV.frame.size.width, height: demoTV.contentSize.height)
        containerView.frame = CGRect(x: containerView.frame.origin.x, y: containerView.frame.origin.y, width: containerView.frame.size.width, height: demoTV.contentSize.height + 10)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidAppear(true)
        
        demoTV.frame = CGRect(x: demoTV.frame.origin.x, y: demoTV.frame.origin.y, width: demoTV.frame.size.width, height: demoTV.contentSize.height)
        containerView.frame = CGRect(x: containerView.frame.origin.x, y: containerView.frame.origin.y, width: containerView.frame.size.width, height: demoTV.contentSize.height + 10)
        demoTV.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! demoTVCell
        cell.name?.text = self.item[indexPath.row]
        return cell
    }
}


