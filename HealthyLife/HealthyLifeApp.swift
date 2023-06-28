//
//  HealthyLifeApp.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 01.06.2023.
//

import SwiftUI
import Firebase

@main
struct HealthyLifeApp: App {
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
                .preferredColorScheme(.light)
                .environmentObject(viewModel)
        }
    }
}
