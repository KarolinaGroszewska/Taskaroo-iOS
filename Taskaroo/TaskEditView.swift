//
//  TaskEditView.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/10/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct TaskEditView: View {
    @StateObject var viewModel = NewItemViewModel()
    var body: some View {
        VStack{
            Text("New Task")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(Color(red: 21/255, green: 99/255, blue: 139/255))
            Form{
                //Title
                TextField("Title", text: $viewModel.title)
                //Description
                TextField("Description", text: $viewModel.description, axis: .vertical)
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
            Button("Submit"){
                addTaskToUser(user: User(email: "Test Name"), task: Task(title: viewModel.title, description: viewModel.description, status: .pending, timeTracker: [], dueDate: viewModel.dueDate))
            }.buttonStyle(BlueButton())
                .padding(.bottom, 20)
        }
        .scrollContentBackground(.hidden)
        .background(Color(red: 214/255, green: 215/255, blue: 217/255))
    }
    func addTaskToUser(user: User, task: Task){
        let db = Firestore.firestore()
        let newDocumentReference = db.collection("users").document(user.id.description).collection("tasks").document()
        try? newDocumentReference.setData(from: task){error in
            if error != nil{
                
            }
        }
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .padding([.leading, .trailing], 4)
            .background(Color(red: 21/255, green: 99/255, blue: 139/255))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}

#Preview {
    TaskEditView()
}
