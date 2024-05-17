//
//  newTweetview.swift
//  mediaApp
//
//  Created by StudentAM on 5/16/24.
//

import SwiftUI

struct NewTweetView: View {
    @Binding var posts: [Post]
    @ObservedObject var profileModel: ProfileModel
    @Environment(\.presentationMode) var presentationMode
    @State private var tweetContent: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("What's happening?", text: $tweetContent)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Tweet") {
                    let newPost = Post(
                        content: tweetContent,
                        author: User(username: profileModel.username, profilePicture: "person.circle.fill", isFollowed: true),
                        likes: 0,
                        comments: []
                    )
                    posts.insert(newPost, at: 0)
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .padding()

                Spacer()
            }
            .navigationBarTitle("New Tweet", displayMode: .inline)
        }
    }
}



