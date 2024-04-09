//
//  SecondaryButtonView.swift
//  Nominations
//
//  Created by Raju Dhumne on 06/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct SecondaryButtonView: View {
    
    let title: String
    var action: (() -> Void)?
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            Text(title)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                .style(.button)
                .foregroundStyle(.black)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
        })
    }
}

#Preview {
    SecondaryButtonView(title: "YES, LEAVE PAGE")
}
