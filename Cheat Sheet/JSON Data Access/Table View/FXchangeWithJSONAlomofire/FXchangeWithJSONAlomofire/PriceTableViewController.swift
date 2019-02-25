//
//  TableViewController.swift
//  FXchangeWithJSONAlomofire
//
//  Created by SOL iOS Mac Mini on 2/25/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    
    var currency = [String]()
    var currencyURL = "http://data.fixer.io/api/latest"
    var accessKey = "de9db0afa05a3298d8ba9103a3161c70"
    var base = "EUR"
    
    
    
    @IBOutlet var customTableView: UITableView!
    @IBAction func reloadDataButton(_ sender: Any) {
        let params = ["access_key":accessKey,"base": base]
        getExchangePrices(url: currencyURL, parameters: params)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let params = ["access_key":accessKey,"base": base]
        getExchangePrices(url: currencyURL, parameters: params)
        
    }
    
    //MARK: - Networking
    
    func getExchangePrices(url: String,parameters: [String:String])
    {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            if response.result.isSuccess{
                print("Success! Got Prices")
                let priceJSON: JSON = JSON(response.result.value!)
                self.updatePrices(json: priceJSON)
            }else{
                print("ERROR \(String(describing: response.result.error))")
            }
            self.customTableView.reloadData()
        }
    }
    
    //MARK: - JSON PARSING
    
    func updatePrices(json: JSON){
        currency.removeAll()
        var latestCurrency = [String]()
        for(name,prices) in json["rates"]{
            let curr = ("\(name) \(prices)")
            currency.append(curr)
        }
        //currency = latestCurrency
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currency.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "priceCell")
        cell?.textLabel?.text = currency[indexPath.row]
        return cell!
    }
}
