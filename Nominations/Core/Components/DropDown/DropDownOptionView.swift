//
//  DropDownOptionView.swift
//  Nominations
//
//  Created by Raju Dhumne on 06/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct DropDownOptionView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .style(.body)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, alignment: .leading)
                
                .foregroundStyle(.black)
                .background(.cubeLightGrey)
        }
    }
}

#Preview {
    DropDownOptionView(title: "Select Option") {
        
    }
}
