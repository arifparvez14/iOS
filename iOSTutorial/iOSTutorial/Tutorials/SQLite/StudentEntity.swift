//
//  StudentEntity.swift
//  iOSTutorial
//

import Foundation

class StudentEntity: BaseEntity {
    let name: String?
    let stdId: String?
    let department: String?
    let hallName: String?
    var maleOrFemale: Int64?

    init(id: Int64?, name: String?, stdId: String?, department: String?, hallName: String?, maleOrFemale: Int64?) {
        self.name = name
        self.stdId = stdId
        self.department = department
        self.hallName = department
        self.maleOrFemale = maleOrFemale
        super.init(baseId: id)
    }
}
