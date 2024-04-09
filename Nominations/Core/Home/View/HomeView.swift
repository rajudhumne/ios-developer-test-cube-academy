//
//  HomeView.swift
//  Nominations
//
//  Created by Raju Dhumne on 06/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

/// Home Screen
///
struct HomeView: View {
    
    /// View Model for Home Screen
    @StateObject var viewModel = HomeViewModel()
    
    @State private var showNominationsForm: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderBarView()
                NominationsHeaderView()
                
                if let nominationsData = viewModel.nominationsData, nominationsData.isEmpty {
                    emptyState
                }else {
                    allNominationsList
                }

//                if viewModel.nominationsData?.isEmpty {
//                    emptyState
//                } else {
//                    allNominationsList
//                }
                buttonFooterView
            }
        }
        .alert("Something went wrong. Please try again!", isPresented: $viewModel.showAlert, actions: {
            Button("Ok") {}
        })
        .background {
            NavigationLink(destination: NominationFormLoadingView(nomineesModel: viewModel.allNomieesResponseData), isActive: $showNominationsForm) {
                EmptyView()
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

extension HomeView {
    private var allNominationsList: some View {
        List {
            ForEach(viewModel.nominationsData ?? []) { nominee in
                NominationRowView(nomation: nominee)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .listStyle(.plain)
        
    }
    
    private var buttonFooterView: some View {
        VStack {
            PrimaryButtonView(title: Constants.Text.Button.CREATE_NEW_NOMINATION, isActive: $viewModel.isActiveButton) {
                showNominationsForm.toggle()
            }
            .frame(width: UIScreen.main.bounds.width * 0.85)
        }
        .frame(width: UIScreen.main.bounds.width, height: 80)
        .background(Color.white
            .shadow(color: .black.opacity(0.1),radius: 5, x: 0, y: -5)
        )
    }
    
    private var emptyState: some View {
        VStack {
            Image(systemName: "tray.fill")
                .resizable()
                .frame(width: 80, height: 60)
                .foregroundStyle(.cubeMidGrey)
            Text(Constants.Text.Home.EMPTY_NOMINATIONS_LIST_TEXT)
                .padding()
                .multilineTextAlignment(.center)
                .foregroundStyle(.cubeDarkGrey)
                .style(.boldHeadlineMedium)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HomeView()
}
