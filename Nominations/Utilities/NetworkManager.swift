//
//  NetworkManager.swift
//  Nominations
//
//  Created by Raju Dhumne on 07/04/24.
//  Copyright © 2024 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation



class NetworkManager {
    
    
    // The Request Method
    enum HTTPMethod: String {
        case get     = "GET"
        case post    = "POST"
        case put     = "PUT"
        case delete  = "DELETE"
    }
    
    enum NetworkError: Error {
        case invalidURL
        case requestFailed(Error)
        case invalidResponse
        case invalidData
    }
    

    func fetch<T:Decodable>(requestUrl: URL, requestBody: Data?, httpMethod: HTTPMethod, resultType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
       {
           var urlRequest = URLRequest(url: requestUrl)
           let authToken = Bundle.main.object(forInfoDictionaryKey: "AUTH_TOKEN") as? String
           urlRequest.httpMethod = httpMethod.rawValue
        
           if let requestBody = requestBody {
               urlRequest.httpBody = requestBody
           }
           
           urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
           urlRequest.setValue(authToken ?? "", forHTTPHeaderField: HTTPHeaderField.authorization.rawValue)
           
           URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in

               if let error = error {
                   completion(.failure(.requestFailed(error)))
                   return
               }

               guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 || httpResponse.statusCode == 201 else {
                   completion(.failure(.invalidResponse))
                   return
               }
               
               guard let data = data else {
                   completion(.failure(.invalidData))
                   return
               }
               
               do {
                   let decodedData = try JSONDecoder().decode(T.self, from: data)
                   DispatchQueue.main.async {
                       completion(.success(decodedData))
                   }
               } catch {
                   DispatchQueue.main.async {
                       completion(.failure(.requestFailed(error)))
                   }
               }
           }.resume()
       }
    
}

