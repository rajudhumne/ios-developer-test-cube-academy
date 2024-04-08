//
//  NominationFormService.swift
//  Nominations
//
//  Created by Raju Dhumne on 08/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

class NominationFormService {
    
    func submitForm(model: NominationRequestModel, completion: @escaping (Result<NominationResponseModel, NetworkManager.NetworkError>) -> Void) {
        
        let networkManager = NetworkManager()
        
        guard let url = URL(string: Endpoints.nomination) else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(model)
            networkManager.fetch(requestUrl: url, requestBody: data, httpMethod: .post, resultType: NominationResponseModel.self, completion: completion)
        } catch let error {
            debugPrint(error.localizedDescription)
        }
    }
    
}
