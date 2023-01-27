//
//  SchoolDetailsViewModelTests.swift
//  NYCSchoolsTests
//
//  Created by Rushi Bhatt on 1/26/23.
//

import XCTest
@testable import NYCSchools

final class SchoolDetailsViewModelTests: XCTestCase {

    var school: School!
    var satDetails: SchoolSATDetail!
    var sut: SchoolDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        school = TestUtil.loadSchoolResponse(from: "MockSchools")?.first
        satDetails = TestUtil.loadSchoolDetailResponse(from: "MockSchoolDetails")?.first
        let service = MockSchoolService()
        let router = MockRouter()
        sut = SchoolDetailsViewModel(school: school,
                                     satDetails: satDetails,
                                     service: service,
                                     router: router)
    }
    
    func testValues() {
        
    }

}
