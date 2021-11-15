//
//  BaseDBModel.swift
//  iOSTutorial
//

import SQLite

class BaseDBModel {

    let table: Table
    let id: Expression<Int64>

     init(id: Expression<Int64>, table: Table) {
        self.table = table
        self.id = id
    }

    func createTable(queryString: String) throws -> Void {
        guard let DB = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.Datastore_Connection_Error
        }
        do {
            _ = try DB.run(queryString)
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func insert(queryString: Insert) throws -> Int64 {
        guard let DB = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.Datastore_Connection_Error
        }
        do {
            let rowId = try DB.run(queryString)
            guard rowId >= 0 else {
                throw DataAccessError.Insert_Error
            }
            return rowId
        } catch _ {
            throw DataAccessError.Insert_Error
        }
    }

    func update(queryUpdate: Update) throws -> Void {
        guard let DB = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.Datastore_Connection_Error
        }

        do {
            try DB.run(queryUpdate)
        } catch _ {
            throw DataAccessError.Update_Error
        }
    }

    func find(findId: Int64) throws -> AnySequence<Row> {
        guard let DB = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.Datastore_Connection_Error
        }
        let query = table.filter(self.id == findId)
        return try DB.prepare(query)
    }

    func find(filter: SchemaType) throws -> AnySequence<Row> {
        guard let DB = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.Datastore_Connection_Error
        }
        return try DB.prepare(filter)
    }


    func findAll() throws -> AnySequence<Row> {
        guard let DB = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.Datastore_Connection_Error
        }

        return try DB.prepare(table)
    }


    func delete(idToDelte: Int64) throws {
        guard let DB = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.Datastore_Connection_Error
        }

        let query = table.filter(id == idToDelte)
        do {
            try DB.run(query.delete())
        } catch _ {

        }
    }


    func deleteAll() throws {
        guard let DB = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.Datastore_Connection_Error
        }

        do {
            try DB.run(table.delete())
        } catch _ {

        }
    }
}
