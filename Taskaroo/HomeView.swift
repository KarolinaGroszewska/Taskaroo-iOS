//
//  HomeView.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/5/23.
//

import SwiftUI


struct HomeView: View {
    @State private var searchText = ""
    @State private var isEditing = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Tasks")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
                HStack{
                        NavigationLink(destination: TaskEditView()) {
                            Image(systemName: "plus.circle")
                        }
                    .font(.title2)
                    .padding(.leading, 10)
                    TextField("\(Image(systemName: "magnifyingglass")) Search", text: $searchText)
                        .padding([.top, .bottom], 4)
                        .background(.white)
                        .cornerRadius(8)
                        .padding(.trailing, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                    if isEditing {
                        Button("", systemImage: "xmark.circle"){
                            self.isEditing = false
                            self.searchText = ""
                        }
                        .font(.title2)
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        //add in slide-in animation for when it appears
                    }
                }
                .padding(.bottom, 10)
                List {
                    ForEach(filteredTasks, id: \.self){ task in
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
                                                .foregroundColor(.black)
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
            .preferredColorScheme(.light)
        }
        .accentColor(Color(red: 21/255, green: 99/255, blue: 139/255))
    }
    var filteredTasks: [Task] {
        if searchText.isEmpty {
            return tasks
        } else {
            return tasks.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#Preview {
    HomeView()
}
