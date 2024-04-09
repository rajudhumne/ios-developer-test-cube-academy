//
//  RatingRowView.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Rating Row View
/// Takes Rating model to show data
///  action call back 
struct RatingRowView: View {
    
    let rating: RatingModel
    let action: () -> Void
    
    var body: some View {
        HStack {
            HStack(spacing: 10) {
                Image(rating.image)
                    .resizable()
                    .frame(width: 25, height: 25)
                
                Text(rating.title)
                    .style(.boldHeadlineSmall)
            }
            .padding(.leading)
            Spacer()
            Button(action: {
                action()
            }, label: {
                Image(rating.selected ? "active_radio" : "inactive_radio")
                    .resizable()
                    .frame(width: 25, height: 25)
            })
            .frame(width: 40, height: 40)
            .padding(.trailing, 5)
        }
        .frame(height: 50)
        .contentShape(Rectangle())
        .border(.cubeMidGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        .background(Color.white
            .shadow(color: .black.opacity(rating.selected ? 0.2 : 0),radius: 5, x: 0, y: 0)
        )
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    RatingRowView(rating: RatingModel(image: "very_unfair", title: "Very Unfair", selected: true, rating: .veryUnfair)) {
        
    }
}
