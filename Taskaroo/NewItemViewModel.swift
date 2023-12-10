//
//  NewItemViewModel.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/10/23.
//

import Foundation

class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var description = ""
    @Published var dueDate = Date()
}
