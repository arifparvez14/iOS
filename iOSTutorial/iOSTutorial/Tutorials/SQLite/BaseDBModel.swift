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

    func createTable(queryString: String) throws {
        guard let database = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.datastoreConnectionError
        }
        do {
            _ = try database.run(queryString)
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func insert(queryString: Insert) throws -> Int64 {
        guard let database = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.datastoreConnectionError
        }
        do {
            let rowId = try database.run(queryString)
            guard rowId >= 0 else {
                throw DataAccessError.insertError
            }
            return rowId
        } catch _ {
            throw DataAccessError.deleteError
        }
    }

    func update(queryUpdate: Update) throws {
        guard let database = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.datastoreConnectionError
        }

        do {
            try database.run(queryUpdate)
        } catch _ {
            throw DataAccessError.updateError
        }
    }

    func find(findId: Int64) throws -> AnySequence<Row> {
        guard let database = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.datastoreConnectionError
        }
        let query = table.filter(self.id == findId)
        return try database.prepare(query)
    }

    func find(filter: SchemaType) throws -> AnySequence<Row> {
        guard let database = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.datastoreConnectionError
        }
        return try database.prepare(filter)
    }

    func findAll() throws -> AnySequence<Row> {
        guard let database = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.datastoreConnectionError
        }

        return try database.prepare(table)
    }

    func delete(idToDelte: Int64) throws {
        guard let database = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.datastoreConnectionError
        }

        let query = table.filter(id == idToDelte)
        do {
            try database.run(query.delete())
        } catch _ {

        }
    }

    func deleteAll() throws {
        guard let database = SQLiteDataStore.sharedInstance.dataBaseConnection else {
            throw DataAccessError.datastoreConnectionError
        }

        do {
            try database.run(table.delete())
        } catch _ {

        }
    }
}
