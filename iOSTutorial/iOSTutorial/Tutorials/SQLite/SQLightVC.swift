//
//  SQLightVC.swift
//  iOSTutorial
//

import UIKit
import SQLite

class SQLightVC: UIViewController {

    var viewTitle: String!
    var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please see console output for the further inquery"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSQLiteDB()
        fetch()
        
        // crash on delete
        // deleteRow()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = viewTitle
        
        self.view.addSubview(label)
        label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8.0).isActive = true
        label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 8.0).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8.0).isActive = true
        label.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 8.0).isActive = true
    }
    
    private func setupSQLiteDB() {
        let initialDBConfigure = InitialDBConfiguration()
        initialDBConfigure.execute()
    }
    
    private func fetch() {
        let allStudentData = try? StudentDBModel.init().fetchAllEntities() as? [StudentEntity]
        if let studentsData = allStudentData {
            for item in 0..<studentsData.count {
                print("\(studentsData[item].name!), \(studentsData[item].stdId!), \(studentsData[item].department!), \(studentsData[item].hallName!), \(studentsData[item].maleOrFemale!)")
            }
        }
        
        print("Total item in DB \(allStudentData?.count ?? 0)")
    }
    
    private func insert() {
        let entity = StudentEntity(
            id: nil,
            name: "Arif",
            stdId: "IT-13037",
            department: "ICT",
            hallName: "MAMH",
            maleOrFemale: 1)
        
        do {
            let row = try StudentDBModel.init().insert(item: entity)
            print("\(row) inserted")
        } catch _ {}
    }
    
    private func update() {
        let entity = StudentEntity(
            id: nil,
            name: "Mahim",
            stdId: "IT-13048",
            department: "ICT",
            hallName: "SZRH",
            maleOrFemale: 1)
        
        do {
            let _: Void = try StudentDBModel.init().updateUsingRow(item: entity, idToCompare: 0)
            print("Updated")
        } catch _ {}
    }
    
    private func deleteRow() {
        do {
            _ = try StudentDBModel.init().deleteUsingRow(id: 0)
            print("Deleted")
        } catch _ {}
    }
}
