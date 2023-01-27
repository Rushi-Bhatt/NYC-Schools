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
        XCTAssertEqual(sut.satSectionTitle, "Urban Assembly School of Design and Construction")
        XCTAssertEqual(sut.satMathLabel, "SAT Average Math Score: 449")
        XCTAssertEqual(sut.satReadingLabel, "SAT Average Reading Score: 404")
        XCTAssertEqual(sut.satWritingLabel, "SAT Average Writing Score: 416")
        
        XCTAssertEqual(sut.overviewSectionTitle, "Overview")
        XCTAssertEqual(sut.overView, "The Urban Assembly School of Design and Construction (SDC) prepares students for college and beyond.")
        
        XCTAssertEqual(sut.contactSectionTitle, "Contact Us")
        XCTAssertEqual(sut.addressLabel, "Address: 525 West 50th Street, Manhattan, NY - 10019")
        XCTAssertEqual(sut.phoneLabel, "Ph: 212-586-0981")
        XCTAssertEqual(sut.websiteLabel, "Website: http://schools.nyc.gov/schoolportals/02/M300")
    }
}
