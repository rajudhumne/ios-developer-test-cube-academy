//
//  NominationFormPopUpView.swift
//  Nominations
//
//  Created by Raju Dhumne on 08/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationFormPopUpView: View {
    
    @Binding var isShowing: Bool
    
    let action: () -> ()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("ARE YOU SURE?")
                            .style(.boldHeadlineMedium)
                        Text("If you leave this page, you will loose any progress made.")
                            .style(.body)
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    VStack {
                        SecondaryButtonView(title: "YES, LEAVE PAGE") {
                            action()
                            
                        }
                        SecondaryButtonView(title: "CANCEL") {
                            isShowing = false
                        }
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width, height: 140)
                    .background(Color.white
                        .shadow(color: .black.opacity(0.1),radius: 5, x: 0, y: -5)
                    )
                }
                .frame(height: 300)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(.white)
                .transition(.move(edge: .bottom))
                
                
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom)
        .animation(.easeInOut, value: isShowing)
    }
}

#Preview {
    NominationFormPopUpView(isShowing: .constant(true)) {
        
    }
}
