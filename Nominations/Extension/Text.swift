//
//  Text.swift
//  Nominations
//
//  Created by Raju Dhumne on 06/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import SwiftUI

extension Text {
    static func redAsterisk(fontSize: CGFloat) -> Text {
        Text("*")
            .font(.system(size: fontSize))
            .foregroundColor(.red)
    }
}

