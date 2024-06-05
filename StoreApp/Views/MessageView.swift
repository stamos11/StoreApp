//
//  MessageView.swift
//  StoreApp
//
//  Created by stamoulis nikolaos on 4/6/24.
//

import SwiftUI


enum MessageType {
    case sucess
    case normal
    case error
}
struct MessageView: View {
    
    let title: String
    let message: String
    let messageType: MessageType
    
    private var backgroundColor: Color {
        switch messageType {
        case .sucess:
            return Color.green
        case .normal:
            return Color.orange
        case .error:
            return Color.red
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(message)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.white)
        .padding()
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        .padding()
    }
        
}

#Preview {
    MessageView(title: "Error", message: "Unable to load products", messageType: .normal)
}
