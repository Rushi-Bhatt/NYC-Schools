//
//  SchoolOverviewCellViewModel.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/25/23.
//

import Foundation

protocol SchoolOverviewCellViewModelProtocol {
    var titleLabel: String? { get }
    var addressLabel: String? { get }
    var phoneNumberLabel: String? { get }
    var websiteLabel: String? { get }
    var website: String? { get }
    var phoneNumber: String? { get }
}

final class SchoolOverviewCellViewModel: SchoolOverviewCellViewModelProtocol {
    
    var titleLabel: String?
    var addressLabel: String?
    var phoneNumberLabel: String?
    var websiteLabel: String?
    var website: String?
    var phoneNumber: String?
    
    private let service: SchoolServiceProtocol
    private let router: RouterProtocol

    
    init(service: SchoolServiceProtocol, router: RouterProtocol) {
        self.service = service
        self.router = router
    }
    
    func configure(with model: School) {
        titleLabel = model.name
        addressLabel = "Address: \(model.address), \(model.city), \(model.state), \(model.zip)"
        phoneNumberLabel = "Ph: \(model.phone)"
        websiteLabel = "Visit Us"
        website = model.website
        phoneNumber = model.phone
    }
    
    func navigateToWebsite() {
        guard let website = website else { return }
        router.openWebview(for: website)
    }
    
    func navigateToPhone() {
        guard let phoneNumber = phoneNumber else { return }
        router.openPhoneNumber(phone: phoneNumber)
    }
}
