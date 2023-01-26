//
//  Utils.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/25/23.
//

import Foundation
import UIKit

// TODO: Can be moved to a Foundation repo and used across different domains
typealias VoidClosure = () -> Void

/// Function to run the block on main queue
/// - Parameters:
///   - delay: delay for dispatch
///   - block: code block to execute
func onMainQueue(after delay: DispatchTimeInterval? = nil,
                 _ block: @escaping VoidClosure) {
    if let interval = delay {
        DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: block)
    } else {
        DispatchQueue.main.async(execute: block)
    }
}

/// Generic toast alert with dismiss
/// - Parameters:
///   - controller: controller on which the toast is to be presented, by default uses topmost VC
///   - message: message to display
func showToast(controller: UIViewController? = topMostController(), message: String) {
    //TODO: Use "message" param for more details regarding error code.
    let alert = UIAlertController(title: nil,
                                  message: LocalizationHelper.localize(key: "Alert.Error.Message"),
                                  preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: LocalizationHelper.localize(key: "Alert.Error.Action.Dismiss"),
                                  style: .cancel,
                                  handler: nil))
    alert.view.alpha = 1
    alert.view.layer.cornerRadius = 15
    controller?.present(alert, animated: true)
}

/// Function to fetch top most VC of on the screen
/// - Returns: View Controller
func topMostController() -> UIViewController? {
    guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }),
          let rootViewController = window.rootViewController else {
              return nil
          }
    
    var topController = rootViewController
    
    while let newTopController = topController.presentedViewController {
        topController = newTopController
    }
    
    return topController
}

