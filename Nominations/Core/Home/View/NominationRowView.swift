//
//  NominationRowView.swift
//  Nominations
//
//  Created by Raju Dhumne on 06/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Home Screen Nomination List Row View 
struct NominationRowView: View {
    let nomation: NominationsDataModel
    
    var body: some View {
        VStack(spacing: 4) {
            Text(nomation.name)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .style(.bodyBold)
                .foregroundStyle(.black)
                .padding(.horizontal)
                
            Text(nomation.reason)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .style(.body)
                .foregroundStyle(.cubeDarkGrey)
                .lineLimit(1)
                .padding(.horizontal)
                
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 65)
        .background(.white)
    }
}
