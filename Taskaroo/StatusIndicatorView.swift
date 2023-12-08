//
//  StatusIndicatorView.swift
//  Taskaroo
//
//  Created by Kari Groszewska on 12/6/23.
//

import SwiftUI

struct StatusIndicator: View {
    @State var buttonTitle: String = ""
    var status: Status
    var body: some View {
        switch status {
        case .completed:
            Text("Completed")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(8)
                .background(Color(red: 96/255, green: 153/255, blue: 45/255))
                .clipShape(Capsule())
        case .pending:
            Text("Pending")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(8)
                .background(Color(red: 250/255, green: 131/255, blue: 33/255))
                .clipShape(Capsule())
        case .blocked:
            Text("Blocked")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(8)
                .background(Color(red: 155/255, green: 29/255, blue: 32/255))
                .clipShape(Capsule())
        }
        
    }
}

struct StatusIndicatorDetail: View {
    @State var buttonTitle: String = ""
    var status: Status
    var body: some View {
        switch status {
        case .completed:
            Text("Completed")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(8)
                .padding([.leading, .trailing], 100)
                .background(Color(red: 96/255, green: 153/255, blue: 45/255))
                .clipShape(Capsule())
        case .pending:
            Text("Pending")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(8)
                .padding([.leading, .trailing], 100)
                .background(Color(red: 250/255, green: 131/255, blue: 33/255))
                .clipShape(Capsule())
        case .blocked:
            Text("Blocked")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(8)
                .padding([.leading, .trailing], 100)
                .background(Color(red: 155/255, green: 29/255, blue: 32/255))
                .clipShape(Capsule())
        }
        
    }
}


