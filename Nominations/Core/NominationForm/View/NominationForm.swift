//
//  NominationForm.swift
//  Nominations
//
//  Created by Raju Dhumne on 06/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Nomination Form Loading View

struct NominationFormLoadingView: View {
    
    /// Takes Nominees Model to initialize view
    
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
    
    // Properties
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
            VStack(spacing: 0) {
                HeaderBarView(title: Constants.Text.NominationForm.NOMINATION_FORM_HEADER_TITLE)
                ScrollView {
                    VStack(spacing: 0) {
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
            .onAppear {
                DispatchQueue.main.async {
                    vm.resetForm()
                }
            }
            .alert("Something went wrong. Please try again!", isPresented: $vm.showAlert) {
                Button("Ok") { }
            }
            
            NominationFormPopUpView(isShowing: $showPopupModel) {
                showPopupModel = false
                dismiss()
            }
        }
    }
    
    func selectedNomineeId(_ id: String) {
        vm.nomineeId = id
        vm.validateForm()
    }
}

extension NominationForm {
    
    private var cubeNameSelectionView: some View {
        VStack(spacing: 20) {
            NominationFieldHeaderView(title: Constants.Text.NominationForm.LIKE_TO_NOMIATE_TITLE, description: Constants.Text.NominationForm.NOMINATION_NAME_SELECTION_DESCRIPTION)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text.redAsterisk(fontSize: 24)
                    Text(Constants.Text.NominationForm.CUBE_NAME_SELECTION)
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
            NominationFieldHeaderView(title: Constants.Text.NominationForm.NOMINATION_REASON_TITLE, description: Constants.Text.NominationForm.NOMINATION_REASON_DESCRIPTION)
            
            VStack(spacing: 0) {
                HStack {
                    Text.redAsterisk(fontSize: 24)
                    Text(Constants.Text.NominationForm.REASONING)
                        .style(.boldHeadlineSmall)
                }
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                
                TextFieldLView(textFieldText: $vm.reasonText)
                    .padding([.leading, .trailing], 18)
                
            }
            .onReceive(vm.$reasonText) { newValue in
                vm.validateForm()
            }
            
            Rectangle()
                .fill(.cubeDarkGrey)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 1)
                .padding(.top, 10)
        }
    }
    
    private var nominaitonRatingView: some View {
        VStack(spacing: 20) {
            NominationFieldHeaderView(title: Constants.Text.NominationForm.NOMINATION_RATING_TITLE, description: Constants.Text.NominationForm.NOMINATION_REASON_DESCRIPTION)
            
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
            SecondaryButtonView(title: Constants.Text.Button.BACK) {
                showPopupModel = true
            }
            PrimaryButtonView(title: Constants.Text.Button.SUBMIT_NOMINATION, isActive: $vm.enableCreateNominationButton) {
                vm.submitForm()
            }
            .frame(width: UIScreen.main.bounds.width * 0.6)
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
