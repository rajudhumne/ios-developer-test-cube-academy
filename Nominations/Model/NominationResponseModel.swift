//
//  NominationResponseModel.swift
//  Nominations
//
//  Created by Raju Dhumne on 08/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct NominationResponseModel: Codable {
    let data: NominationResponse
    
    struct NominationResponse: Codable {
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


