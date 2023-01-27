//
//  MockSchoolService.swift
//  NYCSchoolsTests
//
//  Created by Rushi Bhatt on 1/26/23.
//

import Foundation
@testable import NYCSchools

final class MockSchoolService: SchoolServiceProtocol {
    func getSchools(completion: @escaping (Result<[NYCSchools.School], NYCSchools.ServiceError>) -> Void) {
        guard let response = TestUtil.loadSchoolResponse(from: "MockSchools") else {
            completion(.failure(.unknown))
            return
        }
        completion(.success(response))
    }
    
    func getSchoolSATDetails(completion: @escaping (Result<[NYCSchools.SchoolSATDetail], NYCSchools.ServiceError>) -> Void) {
        guard let response = TestUtil.loadSchoolDetailResponse(from: "MockSchoolDetails") else {
            completion(.failure(.unknown))
            return
        }
        completion(.success(response))
    }
}
