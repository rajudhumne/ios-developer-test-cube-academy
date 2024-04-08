//
//  HomeViewModel.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation


struct NominationsDataModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let reason: String
}


class HomeViewModel: ObservableObject {
    
    private let homeDataService = HomeDataService()
    
    var allNominations: [NominationsModel.Nominations] = []
    var allNominees: [NomineesModel.Nominees] = []
    var allNomieesResponseData: NomineesModel?
    
    @Published var nominationsData: [NominationsDataModel] = []
    @Published var isActiveButton: Bool = false
    
    let dispatchGroup = DispatchGroup()
    
    func getAllNominations() {
        dispatchGroup.enter()
        homeDataService.getAllNominations {[weak self] result in
            self?.dispatchGroup.leave()
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.allNominations = success.data
                }
            case .failure(let failure):
                debugPrint(failure)
            }
        }
    }
    
    func getAllNominees() {
        dispatchGroup.enter()
        homeDataService.getAllNominees { [weak self] result in
            self?.dispatchGroup.leave()
            switch result {
            case .success(let response):
                print(response)
                self?.allNomieesResponseData = response
                self?.allNominees = response.data
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchData() {
        dispatchGroup.enter()
        homeDataService.getAllNominations {[weak self] result in
            self?.dispatchGroup.leave()
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.allNominations = success.data
                }
            case .failure(let failure):
                debugPrint(failure)
            }
        }
        
        dispatchGroup.enter()
        homeDataService.getAllNominees { [weak self] result in
            self?.dispatchGroup.leave()
            switch result {
            case .success(let response):
                self?.allNominees = response.data
                self?.allNomieesResponseData = response
            case .failure(let failure):
                print(failure)
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.mapNominationsAndNomineeData(nominations: self.allNominations, nominees: self.allNominees)
        }
        
    }
    
    func mapNominationsAndNomineeData(nominations: [NominationsModel.Nominations], nominees: [NomineesModel.Nominees]) {
        
        var nominationsDataArr: [NominationsDataModel] = []
        
        for nominee in nominees {
            
            for nomination in nominations {
                
                if nominee.nomineeID == nomination.nomineeID {
                    print("--------------------------------------------")
                    print(nominee.nomineeID)
                    print(nomination.nomineeID)
                    print("--------------------------------------------")
                    
                    nominationsDataArr.append(NominationsDataModel(name: nominee.firstName, reason: nomination.reason))
                }
            }
            
        }
        
        nominationsData = nominationsDataArr
        
        isActiveButton.toggle()
    }
    
}
