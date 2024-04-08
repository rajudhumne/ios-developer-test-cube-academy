//
//  NominationRequestModel.swift
//  Nominations
//
//  Created by Raju Dhumne on 08/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct NominationRequestModel: Codable {
    let nomineeID, reason, process: String

       enum CodingKeys: String, CodingKey {
           case nomineeID = "nominee_id"
           case reason, process
       }
}
