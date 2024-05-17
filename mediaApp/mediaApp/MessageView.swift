//
//  MessageView.swift
//  mediaApp
//
//  Created by StudentAM on 5/16/24.
//

import SwiftUI

struct MessagesView: View {
    let messages = [
        ("AliceSmith", "Hey, how are you?"),
        ("BobJones", "Don't forget about the meeting tomorrow."),
        ("CharlieBrown", "Check out this cool link I found!"),
        ("DianaPrince", "Can you send me the notes from class?"),
        ("EveAdams", "Happy birthday! 🎉")
    ]

    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            Text("Messages")
                .font(.largeTitle)
                .padding()
            
            List(messages, id: \.0) { (username, message) in
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                    VStack(alignment: .leading) {
                        Text(username)
                            .fontWeight(.bold)
                        Text(message)
                            .foregroundColor(.gray)
                    }
                }
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Messages", displayMode: .inline)
    }
}

