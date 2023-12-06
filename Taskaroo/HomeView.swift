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
                List {
                    ForEach(tasks, id: \.self){ task in
                        NavigationLink(destination: TaskDetailView(task: task)) {
                            HStack(alignment: .center, content: {
                                HStack{
                                    VStack (alignment: .leading, spacing: 2){
                                        Text(task.title)
                                            .font(.title2)
                                        Text(formatDate(task.dueDate))
                                            .font(.subheadline)
                                            .foregroundStyle(.gray)
                                    }
                                    Spacer()
                                    StatusIndicator(status: task.status)
                                }
                            })
                        }
                    }
//                    .onDelete(perform: { indexSet in
//                        tasks.remove(atOffsets: indexSet)
//                    })
                }
            }
            .listStyle(.inset)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
