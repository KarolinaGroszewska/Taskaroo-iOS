//
//  TaskDetailView.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/6/23.
//

import SwiftUI

struct TaskDetailView: View {
    var task: Task
    var body: some View {
        Text("Hello, world!")
    }
}

#Preview {
    TaskDetailView(task:     Task(id: 3, title: "Kari", description: "guofceqoye", status: .completed, timeTracker: [], dueDate: Date.now))
}
