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
                .background(Color.green)
                .clipShape(Capsule())
        case .pending:
            Text("Pending")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(8)
                .background(Color.orange)
                .clipShape(Capsule())
        case .blocked:
            Text("Blocked")
                .font(.footnote)
                .foregroundColor(.white)
                .padding(8)
                .background(Color.red)
                .clipShape(Capsule())
        }
        
    }
}

