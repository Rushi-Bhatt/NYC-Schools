//
//  Network.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/22/23.
//

import Foundation

//TODO: Can we moved into a Service/Nerwork repo, and used across domains
protocol NetworkProtocol {
    func fetch<T>(from endpoint: String, completion: @escaping (Result<T, ServiceError>) -> ()) where T: Decodable
}

final class Network: NetworkProtocol {
    private let urlSession: URLSession
    private let baseURL = "https://data.cityofnewyork.us/" //TODO: can be stored in a constant in Foundation repo
    
    init(_ underlyingSession: URLSession = URLSession.shared) {
        self.urlSession = underlyingSession
    }
    
    func fetch<T>(from endpoint: String, completion: @escaping (Result<T, ServiceError>) -> ()) where T: Decodable {
        guard let url = URL(string: baseURL)?.appendingPathComponent(endpoint) else {
            completion(.failure(.endpointError))
            return
        }
        
        urlSession.dataTask(with: url) { data, urlResponse, error in
            if let error = error {
                completion(.failure(.fetchError(error: error)))
                return
            }
            
            guard let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode, 200...299 ~= statusCode else {
                completion(.failure(.fetchError(code: (urlResponse as? HTTPURLResponse)?.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            guard let response = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(.decodingError))
                return
            }
            
            completion(.success(response))
        }.resume()
    }
}
