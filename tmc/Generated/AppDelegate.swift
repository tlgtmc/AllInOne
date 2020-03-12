//
//  AppDelegate.swift
//  tmc
//
//  Created by Tolga Atmaca on 10.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.tmc1,
            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 24)!
        ]
        
        let attrs2 = [
            NSAttributedString.Key.foregroundColor: UIColor.tmc2,
            NSAttributedString.Key.font: UIFont(name: "Georgia", size: 18)!
        ]

        let attrs3 = [
            NSAttributedString.Key.foregroundColor: UIColor.tmc3,
            NSAttributedString.Key.font: UIFont(name: "Georgia", size: 22)!
        ]
        
        UINavigationBar.appearance().titleTextAttributes = attrs
        UINavigationBar.appearance().tintColor = UIColor.tmc3
        UIBarButtonItem.appearance().setTitleTextAttributes(attrs2, for: UIControl.State.normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(attrs3, for: UIControl.State.highlighted)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

