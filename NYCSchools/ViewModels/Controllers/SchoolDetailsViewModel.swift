//
//  SchoolDetailsViewModel.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/24/23.
//

import Foundation

protocol SchoolDetailsViewModelProtocol {
    var school: School { get }
    var satDetails: SchoolSATDetail? { get }
    
    //MARK: SAT Section
    var satSectionTitle: String? { get }
    var satMathLabel: String? { get }
    var satReadingLabel: String? { get }
    var satWritingLabel: String? { get }
    
    //MARK: Overview Section
    var overviewSectionTitle: String? { get }
    var overView: String? { get }
    
    //MARK: Contact Section
    var contactSectionTitle: String? { get }
    var addressLabel: String? { get }
    var phoneLabel: String? { get }
    var websiteLabel: String? { get }
}

final class SchoolDetailsViewModel: SchoolDetailsViewModelProtocol {
    
    var satSectionTitle: String?
    var satMathLabel: String?
    var satReadingLabel: String?
    var satWritingLabel: String?
    
    var overviewSectionTitle: String?
    var overView: String?
    
    var contactSectionTitle: String?
    var addressLabel: String?
    var phoneLabel: String?
    var websiteLabel: String?
    
    private let service: SchoolServiceProtocol
    private let router: RouterProtocol
    
    var school: School
    var satDetails: SchoolSATDetail?
    
    init(school: School, satDetails: SchoolSATDetail?, service: SchoolServiceProtocol, router: RouterProtocol) {
        self.school = school
        self.satDetails = satDetails
        self.service = service
        self.router  = router
        configureData()
    }
    
    private func configureData() {
        satSectionTitle = school.name
        satMathLabel = "SAT Average Math Score: \(satDetails?.satAvgMathScore ?? "N/A")"
        satReadingLabel = "SAT Average Math Score: \(satDetails?.satAvgReadingScore ?? "N/A")"
        satWritingLabel = "SAT Average Math Score: \(satDetails?.satAvgWritingScore ?? "N/A")"
        
        overviewSectionTitle = "Overview"
        overView = school.overview
        
        contactSectionTitle = "Contact Us"
        addressLabel = "Address: \(school.address), \(school.city), \(school.state), \(school.zip)"
        phoneLabel =  "Phone: \(school.phone)"
        websiteLabel = "Website: \(school.website)"
    }
}

