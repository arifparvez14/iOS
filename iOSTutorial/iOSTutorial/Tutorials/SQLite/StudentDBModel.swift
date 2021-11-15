//
//  StudentDBModel.swift
//  iOSTutorial
//

import SQLite

class StudentDBModel: BaseDBModel {
    
    let TABLE_NAME = "StudentTable"
    let name: Expression<String>
    let stdId: Expression<String>
    let department: Expression<String>
    let hallName: Expression<String>
    let maleOrFemale: Expression<Int64>
    
    init() {
        self.name = Expression<String>("name")
        self.stdId = Expression<String>("stdID")
        self.department = Expression<String>("department")
        self.hallName = Expression<String>("hall_name")
        self.maleOrFemale = Expression<Int64>("sex")
        super.init(id: Expression<Int64>("id"), table: Table(TABLE_NAME))
    }
    
    func createTable() throws -> Void {
        do {
            let createTableQueryString = table.create(ifNotExists: true) {t in
                t.column(id, primaryKey: .autoincrement)
                t.column(name)
                t.column(stdId)
                t.column(department)
                t.column(hallName)
                t.column(maleOrFemale)
            }
            
            try createTable(queryString: createTableQueryString)
            
        } catch _ {
            print("Table already exist")
        }
    }
    
    func fetchAllEntities() throws -> [BaseEntity]? {
        var retArray = [BaseEntity]()
        let items = try findAll()
        for item in items {
            
            retArray.append(StudentEntity.init(
                id: item[id],
                name: item[name],
                stdId: item[stdId],
                department: item[department],
                hallName: item[hallName],
                maleOrFemale: item[maleOrFemale]))
        }

        return retArray
    }
    
    func insert(item: BaseEntity) throws -> Int64 {
        if let studentTableModel = item as? StudentEntity {
            let insertStatement = table.insert(
                name <- studentTableModel.name!,
                stdId <- studentTableModel.stdId!,
                department <- studentTableModel.department!,
                hallName <- studentTableModel.hallName!,
                maleOrFemale <- studentTableModel.maleOrFemale!)
            
            guard let rowId = try? insert(queryString: insertStatement) else { return -1 }
            return rowId
        }
        throw DataAccessError.Nil_In_Data
    }
    
    
    
    func update(item: BaseEntity) throws -> Void {
        guard let studentTableModel = item as? StudentEntity else {
            return
        }
        if let findId = studentTableModel.id {
            let query = table.filter(id == findId)
            do {
                let updateQuery = query.update(
                    name <- studentTableModel.name!,
                    stdId <- studentTableModel.stdId!,
                    department <- studentTableModel.department!,
                    hallName <- studentTableModel.hallName!,
                    maleOrFemale <- studentTableModel.maleOrFemale!)

                try update(queryUpdate: updateQuery)

            } catch _ {
                throw DataAccessError.Update_Error
            }
        }
    }
    
    func updateUsingRow(item: BaseEntity, idToCompare: Int64) throws -> Void {
        guard let studentTableModel = item as? StudentEntity else {
            return
        }
        let query = table.filter(idToCompare == id)

        do {
            let updateQuery = query.update(name <- studentTableModel.name!, stdId <- studentTableModel.stdId!, hallName <- studentTableModel.hallName!)
            try update(queryUpdate: updateQuery)
        } catch _ {
            throw DataAccessError.Update_Error
        }
    }
    
    func deleteUsingRow(id: Int64) throws {
        do {
            try delete(idToDelte: id)
        } catch _ {
            throw DataAccessError.Delete_Error
        }
    }
}
