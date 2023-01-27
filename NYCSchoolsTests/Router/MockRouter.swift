//
//  MockRouter.swift
//  NYCSchoolsTests
//
//  Created by Rushi Bhatt on 1/26/23.
//

import UIKit
import Foundation
@testable import NYCSchools

//TODO: Properly configure the mock router
final class MockRouter: RouterProtocol {
    func initiateRootViewController() -> UIViewController {
        return UIViewController()
    }
    
    func navigateToDetailsViewController(school: NYCSchools.School, satDetail: NYCSchools.SchoolSATDetail?) {
        return
    }
    
    func openWebview(for url: String) {
        return
    }
    
    func openPhoneNumber(phone: String) {
        return
    }
}
