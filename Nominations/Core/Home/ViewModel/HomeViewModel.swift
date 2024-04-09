//
//  HomeViewModel.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

/// Data Model for Nominations List
struct NominationsDataModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let reason: String
}

@MainActor
class HomeViewModel: ObservableObject {
    
    private let homeDataService = HomeDataService()
    private var allNominations: [NominationsModel.Nominations] = []
    private var allNominees: [NomineesModel.Nominees] = []
    var allNomieesResponseData: NomineesModel?
    
    @Published var nominationsData: [NominationsDataModel]?
    @Published var isActiveButton: Bool = false
    
    @Published var showAlert: Bool = false
    
    /// Used Dispatch Group for for hanlding two api calls
    private let dispatchGroup = DispatchGroup()
    
    /// API Calls
    func fetchData() {
        dispatchGroup.enter()
        homeDataService.getAllNominations { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self?.allNominations = success.data
                case .failure(_):
                    self?.showAlert = true
                }
                self?.dispatchGroup.leave()
            }
        }
        
        dispatchGroup.enter()
        homeDataService.getAllNominees { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.allNominees = response.data
                    self?.allNomieesResponseData = response
                case .failure(_):
                    self?.showAlert = true
                }
                
                self?.dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.mapNominationsAndNomineeData(nominations: self.allNominations, nominees: self.allNominees)
        }
    }
    
    /// Mapping data from two api response to show nomination list
    func mapNominationsAndNomineeData(nominations: [NominationsModel.Nominations], nominees: [NomineesModel.Nominees]) {
        var nominationsDataArr: [NominationsDataModel] = []
        for nominee in nominees {
            for nomination in nominations {
                if nominee.nomineeID == nomination.nomineeID {
                    nominationsDataArr.append(NominationsDataModel(name: nominee.firstName, reason: nomination.reason))
                }
            }
        }
        nominationsData = nominationsDataArr
        isActiveButton = true
    }
    
}
