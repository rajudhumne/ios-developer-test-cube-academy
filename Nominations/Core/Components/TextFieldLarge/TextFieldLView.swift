//
//  TextFieldLView.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct TextFieldLView: View {
    
    @Binding var textFieldText: String
    
    let charactorLimit = 280
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            if textFieldText.isEmpty {
                VStack {
                    Text("Write something here...")
                        .padding(.top, 14)
                        .padding(.leading, 10)
                        .style(.body)
                        
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                    Spacer()
                }
            }
            
            VStack {
                TextEditor(text: $textFieldText)
                    .padding(.top, 0)
                    .padding(.leading, 8)
                    .frame(minHeight: 200, maxHeight: 200)
                    .opacity(textFieldText.isEmpty ? 0.85 : 1)
                    .border(.cubeDarkGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .style(.bodyBold)
                    .tint(.cubeDarkGrey)
                    .onChange(of: textFieldText) { _, newValue in
                        if newValue.count > charactorLimit {
                            textFieldText = String(newValue.prefix(charactorLimit))
                        }
                    }
                    
                Spacer()
            }
        }
    }
}

#Preview {
    TextFieldLView(textFieldText: .constant(""))
}
