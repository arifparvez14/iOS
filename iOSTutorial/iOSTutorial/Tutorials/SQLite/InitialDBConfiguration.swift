//
//  InitialDBConfiguration.swift
//  iOSTutorial
//

import SQLite

struct InitialDBConfiguration {
    func execute() {
        do {
            let database: Void = try StudentDBModel().createTable()
            print(database)
            
        } catch {
            print(DataAccessError.datastoreConnectionError)
        }
    }
}

enum DataAccessError: Error {
    case datastoreConnectionError
    case insertError
    case updateError
    case deleteError
    case searchError
    case nilInData
}

struct DataBaseConstant {
    static let databaseName = "iOSTutorial.db"
    static let databaseVersion = 1
}
