//
//  TestUtils.swift
//  NYCSchoolsTests
//

import Foundation
@testable import NYCSchools

class TestUtil {
    static func loadSchoolResponse(from fileName: String) -> [School]? {
        let bundle = Bundle(for: self)
        
        if let url = bundle.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([School].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    static func loadSchoolDetailResponse(from fileName: String) -> [SchoolSATDetail]? {
        let bundle = Bundle(for: self)
        
        if let url = bundle.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([SchoolSATDetail].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
