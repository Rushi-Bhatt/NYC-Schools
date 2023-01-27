//
//  Router.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/23/23.
//

import Foundation
import UIKit
import SafariServices

//TODO: Can be moved into the Interface repo, and used across domains

/// Generic Router Protocol, any navigation within the app should be faciliated via this protocol
protocol RouterProtocol {
    func initiateRootViewController() -> UIViewController
    func navigateToDetailsViewController(school: School, satDetail: SchoolSATDetail?)
    func openWebview(for url: String)
    func openPhoneNumber(phone: String)
}

final class Router: RouterProtocol {
    
    private var navigationController: UINavigationController
    private let schoolService: SchoolServiceProtocol
    
    init(schoolService: SchoolServiceProtocol = SchoolService()) {
        self.navigationController = UINavigationController()
        self.schoolService = schoolService
    }
    
    func initiateRootViewController() -> UIViewController {
        let viewModel = HomeViewModel(service: schoolService, router: self)
        let homeViewController = HomeViewController(viewModel: viewModel)
        navigationController.viewControllers = [homeViewController]
        return navigationController
    }
    
    func navigateToDetailsViewController(school: School, satDetail: SchoolSATDetail?) {
        let viewModel = SchoolDetailsViewModel(school: school,
                                               satDetails: satDetail,
                                               service: schoolService,
                                               router: self)
        let schoolDetailsViewController = SchoolDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(schoolDetailsViewController, animated: true)
    }
    
    func openWebview(for url: String) {
        guard let viewController = topMostController() else { return }
        let urlWithScheme = "https://\(url)" //TODO: Backend response should sent the URLs in proper format so we dont need to append schemes on client side.
        guard let url = URL(string: urlWithScheme) else { return }
        let safariVC = SFSafariViewController(url: url)
        viewController.present(safariVC, animated: true, completion: nil)
    }
    
    func openPhoneNumber(phone: String) {
        let phoneNumber = phone.filter { (Int(String($0))) != nil }
        if let url = URL(string: "tel://\(String(describing: phoneNumber))"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else{
            showToast(message: LocalizationHelper.localize(key: "Alert.Error.Message.RealDevice", params: phone))
        }
    }
}
