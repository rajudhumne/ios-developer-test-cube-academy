//
//  NomineesModel.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

// MARK: - NomineesModel
struct NomineesModel: Identifiable, Codable {
    let id = UUID().uuidString
    let data: [Nominees]
    
    struct Nominees: Identifiable, Hashable, Codable {
        let id = UUID().uuidString
        let nomineeID, firstName, lastName: String

        enum CodingKeys: String, CodingKey {
            case nomineeID = "nominee_id"
            case firstName = "first_name"
            case lastName = "last_name"
        }
    }
}


