//
//  ProfilePageView.swift
//  mediaApp
//
//  Created by StudentAM on 5/15/24.
//

import SwiftUI




struct ProfilePageView: View {
    @Binding var isShowingProfile: Bool
    @ObservedObject var profileModel: ProfileModel
    @State private var posts: [Post] = samplePosts
    @State private var isEditAccountPresented = false

    var body: some View {
        NavigationView {
            VStack {
                
                profileHeader
                accountSettingsButton
                followedUsersList
                backButton
            }
            .navigationBarTitle("Your Profile", displayMode: .inline)
        }
        .sheet(isPresented: $isEditAccountPresented) {
            EditAccountView(isEditAccountPresented: $isEditAccountPresented, profileModel: profileModel)
        }
    }

    var profileHeader: some View {
        VStack(alignment: .center, spacing: 20) {
            if let profileImage = profileModel.profileImage {
                Image(uiImage: profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .padding(.top, 20)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipped()
                    .padding(.top, 20)
            }
            
            Text("Display Name: \(profileModel.displayName)")
                .font(.title2)
            
            Text("Nickname: \(profileModel.nickname)")
                .font(.title3)
            
            Text("Username: \(profileModel.username)")
                .font(.headline)
        }
        .padding()
    }

    var accountSettingsButton: some View {
        Button("Account Settings") {
            isEditAccountPresented = true
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
        .padding(.bottom, 20)
    }

    var followedUsersList: some View {
        List {
            ForEach(posts.filter { $0.author.isFollowed }.map { $0.author }) { user in
                HStack {
                    Image(systemName: user.profilePicture)
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text(user.username)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        if let index = posts.firstIndex(where: { $0.author.id == user.id }) {
                            posts[index].author.isFollowed.toggle()
                        }
                    }) {
                        Text(user.isFollowed ? "Unfollow" : "Follow")
                            .foregroundColor(user.isFollowed ? .red : .blue)
                    }
                }
                .padding(.vertical, 5)
            }
        }
    }

    var backButton: some View {
        Button("Back to Home") {
            isShowingProfile = false
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
        .padding(.top, 20)
    }
}



#Preview {
    ContentView()
}
