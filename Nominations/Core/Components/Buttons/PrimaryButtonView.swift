//
//  PrimaryButtonView.swift
//  Nominations
//
//  Created by Raju Dhumne on 06/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct PrimaryButtonView: View {
    
    let title: String
    @Binding var isActive: Bool
    var action: (() -> Void)?
    
    var body: some View {
        VStack {
            Button(action: {
                action?()
            }, label: {
                Text(title)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                    .style(.button)
                    .foregroundStyle(.white)
                    .background(isActive ? .black : .cubeMidGrey)
                    
            })
            .disabled(!isActive)
        }
        
    }
}

#Preview {
    PrimaryButtonView(title: "CREATE NEW NOMINATION", isActive: .constant(false)) {
        
    }
}
