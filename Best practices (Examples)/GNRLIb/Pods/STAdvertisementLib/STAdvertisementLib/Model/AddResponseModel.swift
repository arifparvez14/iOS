//
//  AddResponseModel.swift
//  STAdvertisementLib
//
//  Created by Sharetrip-iOS on 25/05/2021.
//

import Foundation

// MARK: - AddResponseModel
struct AddData: Codable {
    let type: String?
    let width, height: Int?
    let url, script: String?
}
