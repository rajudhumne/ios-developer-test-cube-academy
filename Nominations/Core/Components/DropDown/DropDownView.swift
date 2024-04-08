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
        //        VStack {
        //            ZStack {
        //                ZStack {
        //                    RoundedRectangle(cornerRadius: .zero)
        //                    ScrollView {
        //                        VStack {
        //                            ForEach(dummyData, id: \.self) { index in
        //                                DropDownOptionView(title: "Option \(index)")
        //                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        //                            }
        //
        //                            .padding(.horizontal)
        //                        }
        //                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        //                        .padding(.vertical, 14)
        //                    }
        //                }
        //                .frame(height: showOptions ? 250 : 40)
        //                .offset(y: showOptions ? 40 : 0)
        //            .foregroundStyle(.cubeLightGrey)
        //
        //                ZStack {
        //                    RoundedRectangle(cornerRadius: .zero)
        //                        .frame(height: 40)
        //                        .foregroundStyle(.white)
        //                        .border(.cubeMidGrey, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        //                    HStack {
        //                        Text("Select Option")
        //                            .style(.body)
        //                        Spacer()
        //                        Image(systemName: "chevron.down")
        //                            .font(.headline)
        //                            .foregroundStyle(.cubePink)
        //                            .rotationEffect(Angle(degrees: showOptions ? 0 : -90))
        //                    }
        //                    .padding(.horizontal)
        //
        //                    .onTapGesture {
        //                        withAnimation {
        //                            showOptions.toggle()
        //                        }
        //                    }
        //                }
        //                .offset(y: showOptions ? -105 : 0)
        //            }
        //            .frame(height: showOptions ? 300 : 40)
        //            .offset(y: showOptions ? -25 : 0)
        //
        //
        //        }
        
        
        //        GeometryReader {
        //            let size = $0.size
        //            HStack {
        //                Text("Select Option")
        //                    .style(.body)
        //                    .lineLimit(1)
        //                Spacer()
        //                Image(systemName: "chevron.down")
        //                    .font(.headline)
        //                    .foregroundStyle(.cubePink)
        //                    .rotationEffect(Angle(degrees: showOptions ? 0 : -90))
        //            }
        //            .padding(.horizontal)
        //            .onTapGesture {
        //                withAnimation(.easeInOut) {
        //                    showOptions.toggle()
        //                }
        //            }
        //
        //            if showOptions {
        //                OptionsView()
        //            }
        //
        //        }
        //        .frame(width: .infinity, height: 50)
        //    }
        
        //        GeometryReader {
        //                let size = $0.size
        //
        //                VStack(spacing: 0) {
        //
        //
        //                    if state == .top && showDropdown {
        //                        OptionsView()
        //                    }
        //
        //                    HStack {
        //                        Text(selection == nil ? "Select Option" : selection!)
        //                            .foregroundColor(selection != nil ? .black : .gray)
        //                            .style(.body)
        //                            .lineLimit(1)
        //
        //
        //                        Spacer(minLength: 0)
        //
        //                        Image(systemName: state == .top ? "chevron.up" : "chevron.down")
        //                            .font(.headline)
        //                            .foregroundColor(.cubePink)
        //                            .rotationEffect(.degrees((showDropdown ? -180 : 0)))
        //                    }
        //                    .padding(.horizontal, 15)
        //                    .frame(width: size.width, height: 50)
        //                    .background(.white)
        //                    .contentShape(.rect)
        //                    .onTapGesture {
        //                        index += 1
        //                        zindex = index
        //                        withAnimation(.snappy) {
        //                            showDropdown.toggle()
        //                        }
        //                    }
        //                    .zIndex(10)
        //
        //                    if state == .bottom && showDropdown {
        //                        OptionsView()
        //                    }
        //                }
        //                .clipped()
        //                .background(.white)
        //                .cornerRadius(10)
        //                .overlay {
        //                    RoundedRectangle(cornerRadius: 0)
        //                        .stroke(.gray)
        //                }
        //                .frame(height: showDropdown ? 300 : 40, alignment: state == .top ? .bottom : .top)
        //
        //            }
        //            .frame(minWidth: 0, maxWidth: .infinity)
        //            .zIndex(zindex)
        //        }
        
        
        //    @ViewBuilder
        //    func OptionsView() -> some View {
        //        ScrollView {
        //            VStack(spacing: 0) {
        //                ForEach(options, id: \.self) { option in
        //                    Button {
        //
        //                    } label: {
        //                        Text(option)
        //                            .style(.body)
        //                            .lineLimit(1)
        //                            .padding()
        //                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40)
        //                            .foregroundStyle(.black)
        //                            .background(.cubeLightGrey)
        //                    }
        //                    .animation(.none, value: selection)
        //                    .onTapGesture {
        //                        selection = option
        //                        showDropdown = false
        //                    }
        //                }
        //            }
        //        }
        //    }
        //
        
       
            
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
