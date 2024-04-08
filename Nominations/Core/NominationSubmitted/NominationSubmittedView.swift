//
//  NominationSubmittedView.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationSubmittedView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    HeaderBarView(title: "Nomination Submitted")
                    Image("nomination_submitted_bg")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        
                    VStack {
                        Text("NOMIATION SUBMITTED")
                            .style(.boldHeadlineLarge)
                        Text("Thank you for taking the time to fill out this form! Why not nominate another cube?")
                            .style(.body)
                            .multilineTextAlignment(.center)
                            
                    }
                    .padding(20)
                    
                    Spacer()
                    VStack {
                        PrimaryButtonView(title: "CREATE NEW NOMINATION", isActive: .constant(true))
                        SecondaryButtonView(title: "BACK TO HOME")
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width, height: 140)
                    .background(Color.white
                        .shadow(color: .black.opacity(0.1),radius: 5, x: 0, y: -5)
                    )
                }
            }
        }
        .toolbar(.hidden)
    }
}

#Preview {
    NominationSubmittedView()
}
