//
//  NominationForm.swift
//  Nominations
//
//  Created by Raju Dhumne on 06/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct NominationFormLoadingView: View {
    
    var nomineesModel: NomineesModel?
    
    var body: some View {
        ZStack {
            if let nomineesModel = nomineesModel {
                NavigationView {
                    NominationForm(nomineesModel: nomineesModel)
                }
                .toolbar(.hidden)
            }
        }
    }
}

struct NominationForm: View {
    @State private var selectedOption: String?
    @State private var showOptions: Bool = false
    @State private var showPopupModel: Bool = false
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm: NominationFormViewModel
    
    init(nomineesModel: NomineesModel) {
        _vm = StateObject(wrappedValue: NominationFormViewModel(nomineesModel: nomineesModel))
    }
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    VStack(spacing: 0) {
                        HeaderBarView(title: "Create a nomination")
                        Image("nomination.header.bg")
                            .resizable()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 200)
                        cubeNameSelectionView
                        nominationReasonSectionView
                        nominaitonRatingView
                    }
                }
                buttonsFooterView
                
                
            }
            .background {
                NavigationLink(destination: NominationSubmittedView(), isActive: $vm.showNominationSubmittedView) {
                    EmptyView()
                }
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            NominationFormPopUpView(isShowing: $showPopupModel) {
                showPopupModel = false
                dismiss()
            }
        }
    }
    
    func selectedNomineeId(_ id: String) {
        print(id)
        vm.nomineeId = id
    }
}


extension NominationForm {
    
    private var cubeNameSelectionView: some View {
        VStack(spacing: 20) {
            NominationFieldHeaderView(title: "I'D LIKE TO NOMINATE...", description: "Please select a cube who you feel has done something honourable this month or just all round has a great work ethic.")
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text.redAsterisk(fontSize: 24)
                    Text("Cube's name")
                        .style(.boldHeadlineSmall)
                    
                }
                
                DropDownView(allNominees: vm.nomineesModel.data, selectedNomineeId: selectedNomineeId(_:))
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                
                
                Rectangle()
                    .fill(.cubeDarkGrey)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 1)
                    .padding(.top, 30)
            }
        }
    }
    
    private var nominationReasonSectionView: some View {
        VStack(spacing: 20) {
            NominationFieldHeaderView(title: "I’D LIKE TO NOMINATE THIS CUBE BECAUSE...", description: "Please let us know why you think this cube deserves the ‘cube of the month’ title 🏆⭐")
            
            
            VStack(spacing: 0) {
                HStack {
                    Text.redAsterisk(fontSize: 24)
                    Text("Reasoning")
                        .style(.boldHeadlineSmall)
                }
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                
                TextFieldLView(textFieldText: $vm.reasonText)
                    .padding([.leading, .trailing], 18)
            }
            
            Rectangle()
                .fill(.cubeDarkGrey)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 1)
                .padding(.top, 10)
            
        }
    }
    
    private var nominaitonRatingView: some View {
        VStack(spacing: 20) {
            NominationFieldHeaderView(title: "IS HOW WE CURRENTLY RUN CUBE OF THE MONTH FAIR?", description: "As you know, out the nominees chosen, we spin a wheel to pick the cube of the month. What’s your opinion on this method?")
            
            
            VStack(spacing: 10) {
                ForEach(vm.ratings.indices, id: \.self) { index in
                    RatingRowView(rating: vm.ratings[index]) {
                        vm.ratingTapped(index: index)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
    
    private var buttonsFooterView: some View {
        HStack {
            SecondaryButtonView(title: "Back") {
                showPopupModel = true
            }
            PrimaryButtonView(title: "Submit", isActive: $vm.enableCreateNominationButton) {
                print("Tapped")
                vm.validateForm()
                
            }
                .frame(width: UIScreen.main.bounds.width * 0.6)
                .disabled(vm.enableCreateNominationButton)
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width, height: 80)
        .background(Color.white
            .shadow(color: .black.opacity(0.1),radius: 5, x: 0, y: -5)
        )
    }
}



#Preview {
    NominationForm(nomineesModel: NomineesModel(data: []))
}
