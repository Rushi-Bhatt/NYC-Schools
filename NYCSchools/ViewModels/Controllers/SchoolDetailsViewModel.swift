//
//  SchoolDetailsViewModel.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/24/23.
//

import Foundation

//TODO: we can separate each section in its own view model and views.
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
    
    var school: School
    var satDetails: SchoolSATDetail?
    
    //MARK: SAT Section
    var satSectionTitle: String?
    var satMathLabel: String?
    var satReadingLabel: String?
    var satWritingLabel: String?
    
    //MARK: Overview Section
    var overviewSectionTitle: String?
    var overView: String?
    
    //MARK: Contact Section
    var contactSectionTitle: String?
    var addressLabel: String?
    var phoneLabel: String?
    var websiteLabel: String?
    
    private let service: SchoolServiceProtocol
    private let router: RouterProtocol
    
    init(school: School, satDetails: SchoolSATDetail?, service: SchoolServiceProtocol, router: RouterProtocol) {
        self.school = school
        self.satDetails = satDetails
        self.service = service
        self.router  = router
        configureData()
    }
    
    private func configureData() {
        satSectionTitle = school.name
        satMathLabel = LocalizationHelper.localize(key: "SatMathScore.text", params: satDetails?.satAvgMathScore ?? "N/A")
        satReadingLabel = LocalizationHelper.localize(key: "SatReadingScore.text", params: satDetails?.satAvgMathScore ?? "N/A")
        satWritingLabel = LocalizationHelper.localize(key: "SatWritingScore.text", params: satDetails?.satAvgMathScore ?? "N/A")
        
        overviewSectionTitle = LocalizationHelper.localize(key: "OverviewSection.title")
        overView = school.overview
        
        contactSectionTitle = LocalizationHelper.localize(key: "ContactSection.title")
        addressLabel = LocalizationHelper.localize(key: "AddressLabel.text", params: school.address, school.city, school.state, school.zip)
        phoneLabel =  LocalizationHelper.localize(key: "PhoneLabel.text", params: school.phone)
        websiteLabel = LocalizationHelper.localize(key: "WebsiteLabel.text", params: school.website)
    }
}

