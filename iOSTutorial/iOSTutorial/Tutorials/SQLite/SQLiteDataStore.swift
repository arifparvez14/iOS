//
//  SQLiteStore.swift
//  iOSTutorial
//

import SQLite

class SQLiteDataStore {
    static let sharedInstance = SQLiteDataStore()
    let dataBaseConnection: Connection?

    private init() {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!

        let dbPath = ("\(documentDirectory)/\(DataBaseConstant.databaseName)")
        print("DataBase path: \(dbPath)")
        do {
            dataBaseConnection = try Connection(dbPath)
        } catch _ {
            dataBaseConnection = nil
        }
    }

    func createTables() throws {
        do {
            try StudentDBModel().createTable()
        } catch {
            throw DataAccessError.datastoreConnectionError
        }
    }
}
