//
//  HomeView.swift
//  Nominations
//
//  Created by Raju Dhumne on 06/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    
    
    @StateObject var viewModel = HomeViewModel()
    @State var isActive : Bool = false
    
    @State private var showNominationsForm: Bool = false
    
    var body: some View {
        ZStack {
            Color.white

            VStack(spacing: 0) {
                HeaderBarView()
                NominationsHeaderView()
                
//                Spacer()
                if viewModel.nominationsData.isEmpty {
                    emptyState
                } else {
                    allNominationsList
                }
                
                
                buttonFooterView
              
            }
            
        }
        .background {
            NavigationLink(destination: NominationFormLoadingView(nomineesModel: viewModel.allNomieesResponseData), isActive: $showNominationsForm) {
                EmptyView()
            }
        }
        .onAppear(perform: {
            viewModel.fetchData()
        })
        
    }
}

extension HomeView {
    private var allNominationsList: some View {
        List {
            ForEach(viewModel.nominationsData) { nominee in
                NominationRowView(nomation: nominee)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .listStyle(.plain)
        
    }
    
    private var buttonFooterView: some View {
        VStack {
            PrimaryButtonView(title: "CREATE NEW NOMINATION", isActive: $viewModel.isActiveButton) {
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
            Text("ONCE YOU SUMBIT A NOMINATION, YOU WILL BE ABLE TO SEE IT HERE")
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
