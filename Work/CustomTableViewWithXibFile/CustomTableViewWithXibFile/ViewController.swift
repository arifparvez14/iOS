//
//  ViewController.swift
//  CustomTableViewWithXibFile
//
//  Created by SOL iOS Mac Mini on 4/4/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

struct cellData {
    let cell: Int!
    let text: String!
    let image: UIImage!
}
class TableViewController: UITableViewController {
    
    var arrayOfCellData = [cellData]()
    
    override func viewDidLoad() {
        
        arrayOfCellData = [cellData(cell: 1, text: "First", image: #imageLiteral(resourceName: "56120021_2428466230721871_3684774991540256768_n")),
                           cellData(cell: 2, text: "Second", image: #imageLiteral(resourceName: "56120021_2428466230721871_3684774991540256768_n")),
                           cellData(cell: 3, text: "Third", image: #imageLiteral(resourceName: "56120021_2428466230721871_3684774991540256768_n"))]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrayOfCellData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayOfCellData[indexPath.row].cell == 1 {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
        }
        else if arrayOfCellData[indexPath.row].cell == 2{
            
            let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
        }
        else {
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayOfCellData[indexPath.row].cell == 1 {
            return 173
        }
        else if arrayOfCellData[indexPath.row].cell == 2{
            return 154
        }
        else {
            return 173
        }
    }
    

}

