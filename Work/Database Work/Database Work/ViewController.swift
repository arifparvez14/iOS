//
//  ViewController.swift
//  Database Work
//
//  Created by SOL iOS Mac Mini on 5/7/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    var database: Connection!
    
    let userTable = Table("users")
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let email = Expression<String>("email")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        }catch{
            print(error)
        }
        
    }
    
    @IBAction func createTable(_ sender: Any) {
        print("CREATE TAPPED")
        
        let createTable = self.userTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.name)
            table.column(self.email, unique: true)
        }
        
        do {
            try self.database.run(createTable)
            print("Create Table")
        }catch {
            print(error)
        }
    }
    
    @IBAction func insertUser(_ sender: Any) {
        print("INSERT TAPPED")
        
        let alert = UIAlertController(title: "Insert User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "Name" }
        alert.addTextField { (tf) in tf.placeholder = "Email" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let name = alert.textFields?.first?.text,
                let email = alert.textFields?.last?.text
                else { return }
            print(name)
            print(email)
            
            let insertUser = self.userTable.insert(self.name <- name, self.email <- email)
            
            do{
                try self.database.run(insertUser)
                print("INSERT USER")
            } catch{
                print(error)
            }
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func listUser(_ sender: Any) {
        print("LISTUSER TAPPED")
        
        do {
            let users = try self.database.prepare(self.userTable)
            for user in users {
                print("userId: \(user[self.id]), name: \(user[self.name]), email: \(user[self.email])")
            }
        } catch {
            print(error)
        }
    }
    
    
    @IBAction func updateUser(_ sender: Any) {
        print("UPDATEUSER TAPPED")
        
        let alert = UIAlertController(title: "Update User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "User ID" }
        alert.addTextField { (tf) in tf.placeholder = "Email" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let userIDString = alert.textFields?.first?.text,
                let userID = Int(userIDString),
                let email = alert.textFields?.last?.text
                else { return }
            print(userIDString)
            print(email)
            
            let user = self.userTable.filter(self.id == userID)
            let updateUser = user.update(self.email <- email)
            do {
                try self.database.run(updateUser)
            } catch {
                print(error)
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteUser(_ sender: Any) {
        print("DELETEUSER TAPPED")
        
        let alert = UIAlertController(title: "Update User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "User ID" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let userIDString = alert.textFields?.first?.text,
            let userID = Int(userIDString)
                else { return }
            print(userIDString)
            
            let user = self.userTable.filter(self.id == userID)
            let deleteUser = user.delete()
            do {
                try self.database.run(deleteUser)
            } catch {
                print(error)
            }
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

