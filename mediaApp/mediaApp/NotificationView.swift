//
//  NotificationView.swift
//  mediaApp
//
//  Created by StudentAM on 5/16/24.
//

import SwiftUI

struct NotificationsView: View {
    let notifications = [
        "AliceSmith liked your post.",
        "BobJones commented: 'Great photo!'",
        "CharlieBrown started following you.",
        "DianaPrince mentioned you in a comment.",
        "EveAdams liked your comment."
    ]

    var body: some View {
        VStack {
            Text("Notifications")
                .font(.largeTitle)
                .padding()
            
            List(notifications, id: \.self) { notification in
                Text(notification)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Notifications", displayMode: .inline)
    }
}
