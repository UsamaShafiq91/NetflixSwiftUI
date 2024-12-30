//
//  NotificationBar.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 30/12/2024.
//

import SwiftUI

struct NotificationBar: View {
    
    @Binding var showNotificationList: Bool
    
    var body: some View {
        Button(action: {
            showNotificationList = true
        }, label: {
            HStack {
                Image(systemName: "bell")
                    .font(.title3)
                
                Text("Notifications")
                
                Spacer()
                Image(systemName: "chevron.right")
            }
        })
        .foregroundStyle(.white)
    }
}

#Preview {
    NotificationBar(showNotificationList: .constant(false))
}
