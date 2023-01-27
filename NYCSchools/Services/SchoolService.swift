//
//  SchoolService.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/22/23.
//

import Foundation

//TODO: Can we moved into a Service/Nerwork repo, and used across domains

/// Enum indicating various types of service error
enum ServiceError: Error {
    case endpointError
    case fetchError(code: Int?)
    case fetchError(error: Error)
    case noData
    case decodingError
    case unknown
}

//TODO: ideal paths would have a proper format with path components and query parameters.

/// Enum indicating all backend url routes
enum ServiceURL {
    case allSchools
    case schoolSATDetails
    
    var path: String {
        switch self {
        case .allSchools:
            return "resource/s3k6-pzi2.json"
        case .schoolSATDetails:
            return "resource/f9bf-2cp4.json"
        }
    }
}

/// This protocol defines the SchoolService
protocol SchoolServiceProtocol {
    
    /// Fetch list of schools
    /// - Parameter completion: A closure containing the `Result` of the request.
    func getSchools(completion: @escaping (Result<[School], ServiceError>) -> Void)
    
    
    /// Fetch details of schools
    /// - Parameter completion: A closure containing the `Result` of the request.
    func getSchoolSATDetails(completion: @escaping (Result<[SchoolSATDetail], ServiceError>) -> Void)
}

final class SchoolService: SchoolServiceProtocol {
    
    private let network: NetworkProtocol
    
    init(_ network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func getSchools(completion: @escaping (Result<[School], ServiceError>) -> Void) {
        network.fetch(from: ServiceURL.allSchools.path, completion: completion)
    }
    
    func getSchoolSATDetails(completion: @escaping (Result<[SchoolSATDetail], ServiceError>) -> Void) {
        network.fetch(from: ServiceURL.schoolSATDetails.path, completion: completion)
    }
}
