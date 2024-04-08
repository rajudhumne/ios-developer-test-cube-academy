//
//  APIConstants.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct Endpoints {
    static let nominee = "https://cube-academy-api.cubeapis.com/api/nominee"
    static let nomination = "https://cube-academy-api.cubeapis.com/api/nomination"
}

enum HTTPHeaderField: String {
    case authorization = "Authorization"
    case contentType = "Content-Type"
}

enum ContentType: String {
    case json = "application/json"
}
