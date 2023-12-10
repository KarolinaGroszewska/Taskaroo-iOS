//
//  NotificationManager.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/9/23.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options){ (success, error) in
            if let error = error{
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
}
