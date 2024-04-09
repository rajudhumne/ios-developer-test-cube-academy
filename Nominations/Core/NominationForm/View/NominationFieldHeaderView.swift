//
//  NominationFieldHeaderView.swift
//  Nominations
//
//  Created by Raju Dhumne on 06/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Nomination Form Fields View takes title and description
/// 
struct NominationFieldHeaderView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .style(.boldHeadlineSmall)
                .foregroundStyle(.black)
            Text(description)
                .style(.body)
                .foregroundStyle(.cubeDarkGrey)
        }
        .padding()
    }
}

#Preview {
    NominationFieldHeaderView(title: "", description: "")
}
