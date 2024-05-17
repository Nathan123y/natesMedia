//
//  PostView.swift
//  mediaApp
//
//  Created by StudentAM on 5/16/24.
//

import SwiftUI

struct PostView: View {
   var post: Post
   @State private var isLiked = false

   var body: some View {
       VStack(alignment: .leading, spacing: 10) {
           HStack {
               Image(post.author.profilePicture) // Placeholder image
                   .resizable()
                   .frame(width: 50, height: 50)
                   .clipShape(Circle())
               Text(post.author.username)
                   .fontWeight(.bold)
           }

           Text(post.content)
               .padding(.vertical)

           HStack {
               Button(action: {
                   isLiked.toggle()
               }) {
                   Image(systemName: isLiked ? "heart.fill" : "heart")
                       .foregroundColor(isLiked ? .red : .gray)
               }
               Text("\(post.likes + (isLiked ? 1 : 0))")
               
               Spacer()
               
               Button(action: {
                   // Placeholder for comment action
               }) {
                   Image(systemName: "message")
               }
               Text("\(post.comments.count)")
           }
           .padding(.vertical, 5)
       }
       .padding()
   }
}

