//
//  Task.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/5/23.
//

import Foundation
import SwiftUI
enum Status: String{
    case pending
    case completed
    case blocked
    case archived
}
struct Task: Identifiable, Hashable{
    var id: Int
    var title: String
    var description: String
    var status: Status
    var timeTracker: [Date]
    var dueDate: Date
}

var tasks: [Task] = [
    Task(id: 1, title: "This is a test", description: "gywduobds", status: .pending, timeTracker: [], dueDate: Date.distantFuture),
    Task(id: 2, title: "How cool", description: "gysdeiygedw", status: .blocked, timeTracker: [], dueDate: Date.now),
    Task(id: 3, title: "Kari", description: "guofceqoye", status: .completed, timeTracker: [], dueDate: Date.distantPast)
]

func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter.string(from: date)
}
