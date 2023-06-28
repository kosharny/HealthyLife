//
//  AppDelegate.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 27.06.2023.
//

import SwiftUI
import FBSDKCoreKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Facebook SDK
               FBSDKCoreKit.ApplicationDelegate.shared.application(
                   application,
                   didFinishLaunchingWithOptions: launchOptions
               )
               return true
    }
}
