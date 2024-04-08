//
//  RatingModel.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct RatingModel: Identifiable, Hashable {
    let id = UUID().uuidString
    let image: String
    let title: String
    var selected: Bool
    let rating: Rating
}



