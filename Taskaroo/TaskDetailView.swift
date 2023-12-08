//
//  TaskDetailView.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/6/23.
//

import SwiftUI

struct TaskDetailView: View {
    @State var timerRunning: Bool = false
    @State var task: Task
    var body: some View {
        ZStack{
            Color(red: 214/255, green: 215/255, blue: 217/255).ignoresSafeArea()
            VStack{
                
                Text(task.title)
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Text("Due Date: " + formatDate(task.dueDate))
                Text(task.description)
                    .padding([.leading, .trailing], 15)
                    .padding([.top], 1)
                    .multilineTextAlignment(.leading)
                StatusIndicatorDetail(status: task.status)
                Text(extractDates(task: task))
                Spacer()
                HStack{
                    if task.status.rawValue == "completed"{
                        Button("", systemImage: "archivebox"){
                            task.status = .archived
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                        .padding(.leading, 15)
                    }else{
                        Button("", systemImage: "checkmark.square"){
                            task.status = .completed
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                        .padding(.leading, 15)
                    }
                    Spacer()
                    if task.status.rawValue == "pending" {
                        Button("", systemImage: "xmark.octagon"){
                            task.status = .blocked
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                    }
                    else{
                        Button("", systemImage: "exclamationmark.triangle"){
                            task.status = .pending
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                    }
                    
                    Spacer()
                    if timerRunning{
                        Button("", systemImage: "stop.circle"){
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                    }
                    else{
                        Button("", systemImage: "timer"){
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                    }
                    Spacer()
                    Button("", systemImage: "calendar.badge.plus"){
                    }
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                    .padding(.trailing, 15)
                }
                .padding(.top, 20)
                .background(.white)
            }
        }
    }
    private func extractDates(task: Task) -> String{
        if task.timeTracker.isEmpty {
            return "Elapsed time: 0:00:00"
        }
        else if (task.timeTracker.count % 2 == 1){
            timerRunning = true
            return "Elapsed time: \(task.timeTracker.last?.timeIntervalSinceNow ?? Date(timeIntervalSinceNow: 0).timeIntervalSinceNow)"
        }
        else{
            for date in task.timeTracker{
                print(date)
            }
            return "Total elapsed time:"
        }
    }
}


#Preview {
    TaskDetailView(task: Task(id: 3, title: "Kari", description: "This is a sample description for a task I would be completing, how cool of me.", status: .completed, timeTracker: [], dueDate: Date.now))
}
