//
//  TaskarooApp.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/4/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuthUI
import FirebaseFirestore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}
@main
struct TaskarooApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @StateObject var viewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
            AuthView()
                .environmentObject(viewModel)
        }
    }
}

