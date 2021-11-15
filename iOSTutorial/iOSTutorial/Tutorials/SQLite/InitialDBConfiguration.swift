//
//  InitialDBConfiguration.swift
//  iOSTutorial
//

import SQLite

struct InitialDBConfiguration {
    func execute() {
        do {
            let db: Void = try StudentDBModel().createTable()
            print(db)
            
        } catch {
            print(DataAccessError.Datastore_Connection_Error)
        }
    }
}

enum DataAccessError: Error {
    case Datastore_Connection_Error
    case Insert_Error
    case Update_Error
    case Delete_Error
    case Search_Error
    case Nil_In_Data
}

struct DataBaseConstant {
    static let DATABASE_NAME = "iOSTutorial.db";
    static let DATABASE_VERSION = 1
}
