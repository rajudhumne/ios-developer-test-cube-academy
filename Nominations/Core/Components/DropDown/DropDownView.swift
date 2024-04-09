//
//  DropDownView.swift
//  Nominations
//
//  Created by Raju Dhumne on 06/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct DropDownView: View {
    
    // Properteis
    @State private var selectedNomineeName: String?
    @State private var showDropdown = false
    
    let allNominees: [NomineesModel.Nominees]
    let selectedNomineeId: (String) -> ()
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: .zero)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40)
                    .foregroundStyle(.white)
                    .border(.cubeMidGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                HStack {
                    Text(selectedNomineeName == nil ? "Select Option" : selectedNomineeName ?? "Select Option")
                        .style(.body)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.headline)
                        .foregroundStyle(.cubePink)
                        .rotationEffect(Angle(degrees: showDropdown ? 90 : 0))
                    
                }
                .padding(.horizontal)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40)
                .onTapGesture {
                    withAnimation(.snappy) {
                        showDropdown.toggle()
                    }
                }
            }
            
            if showDropdown {
                ZStack {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(allNominees, id: \.self) { nominee in
                                DropDownOptionView(title: "\(nominee.firstName) \(nominee.lastName)") {
                                    withAnimation(.snappy) {
                                        showDropdown.toggle()
                                        self.selectedNomineeName = "\(nominee.firstName) \(nominee.lastName)"
                                        self.selectedNomineeId(nominee.nomineeID)
                                    }
                                }
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, maxHeight: 300)
                }
            }
        }
        
    }
}

//#Preview {
//    DropDownView(nomineeId: .constant("Option Selected"), allNominees: [], selectedNomineeId: <#(String) -> ()#>)
//}
