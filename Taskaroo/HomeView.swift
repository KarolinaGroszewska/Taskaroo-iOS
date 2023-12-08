//
//  HomeView.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/5/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Tasks")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                List {
                    ForEach(tasks, id: \.self){ task in
                        if task.status != .archived {
                            NavigationLink(destination: TaskDetailView(task: task)) {
                                HStack(alignment: .center, content: {
                                    HStack{
                                        VStack (alignment: .leading, spacing: 2){
                                            Text(task.title)
                                                .font(.title2)
                                                .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                                            Text(formatDate(task.dueDate))
                                                .fontWeight(.light)
                                                .font(.system(size: 13))
                                        }
                                        Spacer()
                                        StatusIndicator(status: task.status)
                                    }
                                })
                            }
                            .listRowBackground(Color(red: 214/255, green: 215/255, blue: 217/255))
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                
            }
            .background(Color(red: 214/255, green: 215/255, blue: 217/255))
            .listStyle(.inset)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
