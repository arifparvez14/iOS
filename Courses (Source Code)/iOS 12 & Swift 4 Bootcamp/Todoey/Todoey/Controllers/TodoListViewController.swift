//
//  TodoListViewController.swift
//  Todoey
//
//  Created by SOL MAC 15 on 10/1/20.
//  Copyright © 2020 SOL MAC 15. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class TodoListViewController: SwipeTableViewController {

    //var itemArray = [Item]() //This used for codable
    //var itemArray = [ItemList]() //Core Data model
    var itemArray: Results<Items>?
    let realm = try! Realm()
    
    // <-- Load categories for core data -->
    /*
    var selectedCategory: Categories? {
        didSet {
            loadItem()
        }
    }
    */
    
    //Load categories for realm
    var selectedCategory: Category? {
        didSet {
            loadItem()
        }
    }
    
    let defaults = UserDefaults.standard
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = itemArray?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No Items Added"
        }
        
        return cell
    }
    
    //MARK: - Tableview view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // <-- Code snipped for core data -->
        
        //Can update like this
        //itemArray[indexPath.row].setValue("Complete", forKey: "title)
        
        //Remove element from core data
        //context.delete(itemArray[indexPath.row])
        //itemArray.remove(at: indexPath.row)
        //tableView.deselectRow(at: indexPath, animated: true)
        
        //itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        //saveItem()
        
        // <-- Code snipped for Realm -->
        //Update using realm
        
        if let item = itemArray?[indexPath.row] {
            do {
                try realm.write {
                    //For update
                    item.done = !item.done
                    
                    //For delete
                    //realm.delete(item)
                }
            } catch {
                print("Saving done status, \(error)")
            }
        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
           // <-- Code snipped used for Codable -->
            
            /*let newItem = Item()
              newItem.title = textField.text!
              self.itemArray.append(newItem)
              self.saveItem()*/

            
            // <-- Code snipped for core data -->
             /*
                let newData = ItemList(context: self.context)
                newData.title = textField.text!
                newData.done = false
                newData.parentCategory = self.selectedCategory
                self.itemArray.append(newData)
                */
            
            // <-- Code snipped for realm -->
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let newData = Items()
                        newData.title = textField.text!
                        newData.dateCreated = Date()
                        currentCategory.items.append(newData)
                    }
                }catch {
                    print("Error saving new items, \(error)")
                }
            }
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Coder Model Manipulate Methods
    
    /*func saveItem() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array ")
        }
        self.tableView.reloadData()
    }
    
    func loadItem() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array, \(error)")
            }
        }
    }*/
    
    //MARK: - Core Data Model Manipulate Methods
    /*
    func saveItem() {
        
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadItem(with request: NSFetchRequest<ItemList> = ItemList.fetchRequest(), predicate: NSPredicate? = nil) {
        
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@",selectedCategory!.name!)
        
        if let additionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
        } else {
            request.predicate = categoryPredicate
        }
        
        
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error frtching data from context \(error)")
        }
        tableView.reloadData()
    }
    */
    
    //MARK: - Realm Model Manipulate Methods
    
    func loadItem() {
        
        itemArray = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        tableView.reloadData()
    }
    
    //MARK: - Delete data from swipe
    
    override func updateModel(at indexPath: IndexPath) {
        if let item = self.itemArray?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(item)
                }
            } catch {
                print("Error deleting category, \(error)")
            }
        }
    }
}

//MARK: - UISearchBar Methods

extension TodoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
       // <-- Core data search bar implementation -->
       /*
        let request: NSFetchRequest<ItemList> = ItemList.fetchRequest()
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        loadItem(with: request, predicate: predicate)
        */
        
       // <-- Realm search bar implementation -->
        itemArray = itemArray?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItem()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
