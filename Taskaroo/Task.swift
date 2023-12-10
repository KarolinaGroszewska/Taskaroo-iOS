//
//  Task.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/5/23.
//

import Foundation
import SwiftUI
enum Status: String, Encodable{
    case pending
    case completed
    case blocked
    case archived
}

struct Task: Encodable, Identifiable, Hashable{
    var id = UUID()
    var title: String
    var description: String
    var status: Status
    var timeTracker: [Date]
    var dueDate: Date
}



func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter.string(from: date)
}
