//
//  HomeDataService.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation


class HomeDataService {

    func getAllNominations(completion: @escaping (Result<NominationsModel, NetworkManager.NetworkError>) -> Void) {
        let networkManager = NetworkManager()
        
        guard let url = URL(string: Endpoints.nomination) else {
            return
        }
        
        networkManager.fetch(requestUrl: url, requestBody: nil, httpMethod: .get, resultType: NominationsModel.self, completion: completion)
    }
    
    func getAllNominees(completion: @escaping (Result<NomineesModel, NetworkManager.NetworkError>) -> Void) {
        let networkManager = NetworkManager()
        
        guard let url = URL(string: Endpoints.nominee) else {
            return
        }
        
        networkManager.fetch(requestUrl: url, requestBody: nil, httpMethod: .get, resultType: NomineesModel.self, completion: completion)
    }
    
}
