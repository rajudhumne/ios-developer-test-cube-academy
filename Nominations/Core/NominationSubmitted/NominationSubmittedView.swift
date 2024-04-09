//
//  NominationSubmittedView.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Nomination Submitted Screen
struct NominationSubmittedView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    HeaderBarView(title: Constants.Text.Button.NOMINATION_SUBMITTED)
                    Image("nomination_submitted_bg")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        
                    VStack {
                        Text(Constants.Text.Button.NOMINATION_SUBMITTED.uppercased())
                            .style(.boldHeadlineLarge)
                        Text(Constants.Text.NominationSubmitted.NOMINATION_SUBMITTED_DESCRIPTION)
                            .style(.body)
                            .multilineTextAlignment(.center)
                            
                    }
                    .padding(20)
                    
                    Spacer()
                    VStack {
                        PrimaryButtonView(title: Constants.Text.Button.CREATE_NEW_NOMINATION, isActive: .constant(true)) {
                            dismiss()
                        }
                        SecondaryButtonView(title: Constants.Text.Button.BACK_TO_HOME) {
                            NavigationUtil.popToRootView(animated: true)
                        }
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
