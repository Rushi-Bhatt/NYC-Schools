//
//  AppDelegate.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/22/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let router = Router()
        let rootViewController = router.initiateRootViewController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
        return true
    }
}

//TODO: Handle deep links and universal links in CanOpenURL handler
//TODO: Here I have removed the sceneDelegate, but we can customize that as well to make the root window
