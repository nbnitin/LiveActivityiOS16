//
//  ActivityDemoApp.swift
//  ActivityDemo
//
//  Created by Nitin Bhatia on 23/11/22.
//

import SwiftUI
import ActivityKit

@main
struct ActivityDemoApp: App {
    
    let center = UNUserNotificationCenter.current()
    
    init() {
        registerForNotification()
    }
    
    func registerForNotification() {
        UIApplication.shared.registerForRemoteNotifications()
        let center : UNUserNotificationCenter = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.sound , .alert , .badge ], completionHandler: { (granted, error) in
            if ((error != nil)) { UIApplication.shared.registerForRemoteNotifications() }
            else {
                
            }
        })
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
