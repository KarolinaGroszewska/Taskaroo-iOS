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


@main
struct TaskarooApp: App {
    @StateObject var viewModel = AuthenticationViewModel()

    init() {
      setupAuthentication()
    }
    var body: some Scene {
        WindowGroup {
            AuthView()
                .environmentObject(viewModel)
        }
    }
}
extension TaskarooApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
      let db = Firestore.firestore()
  }
}
