//
//  NominationsModel.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

// MARK: - NominationsModel
struct NominationsModel: Identifiable, Codable {
    let id = UUID().uuidString
    let data: [Nominations]
    
    // MARK: - Datum
    struct Nominations: Identifiable, Codable {
        let id = UUID().uuidString
        let nominationID, nomineeID, reason, process: String
        let dateSubmitted, closingDate: String

        enum CodingKeys: String, CodingKey {
            case nominationID = "nomination_id"
            case nomineeID = "nominee_id"
            case reason, process
            case dateSubmitted = "date_submitted"
            case closingDate = "closing_date"
        }
    }

}

