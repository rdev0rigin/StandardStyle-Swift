//
//  AppDelegate.swift
//  standard-style-swift
//
//  Created by Raven on 4/2/18.
//  Copyright © 2018 RDevelopment. All rights reserved.
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
            FirebaseApp.configure()
        
            let rootViewController = ViewController()
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = rootViewController
            window?.makeKeyAndVisible()
        return true
    }
}

