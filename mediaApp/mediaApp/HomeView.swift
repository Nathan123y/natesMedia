//
//  HomeView.swift
//  mediaApp
//
//  Created by StudentAM on 5/14/24.
//



import SwiftUI


struct HomeView: View {
    @Binding var isShowingProfile: Bool
    @ObservedObject var profileModel: ProfileModel
    @State private var currentIndex = 0
    @State private var posts: [Post] = samplePosts
    @State private var isShowingNewTweetView = false
    @State private var commentContent: String = ""
    @State private var isAddingComment = false

    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    
                    
                    headerView
                    Spacer()
                    postView(post: posts[currentIndex])
                    Spacer()
                    if isAddingComment {
                        commentInputView
                    }
                    buttonsView
                }
                .navigationBarHidden(true)
                .sheet(isPresented: $isShowingNewTweetView) {
                    NewTweetView(posts: $posts, profileModel: profileModel)
                }
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationView {
                SearchView()
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }

            NavigationView {
                NotificationsView()
            }
            .tabItem {
                Label("Notifications", systemImage: "bell")
            }

            NavigationView {
                MessagesView()
            }
            .tabItem {
                Label("Messages", systemImage: "message")
            }
        }
    }

    var headerView: some View {
        HStack {
            if let profileImage = profileModel.profileImage {
                Image(uiImage: profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.leading)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .padding(.leading)
            }
            Spacer()
            Text("Nate's Media")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
                .padding(.bottom, 10)
            Spacer()
        }
    }

    func postView(post: Post) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: post.author.profilePicture) // Placeholder image
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(post.author.username)
                    .fontWeight(.bold)
            }
            .padding(.leading)

            Text(post.content)
                .padding(.horizontal)
                .padding(.vertical, 5)

            HStack {
                Button(action: {
                    posts[currentIndex].likes += 1
                }) {
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                }
                Text("\(post.likes)")

                Spacer()

                Button(action: {
                    isAddingComment.toggle()
                }) {
                    Image(systemName: "message")
                }
                Text("\(post.comments.count)")
            }
            .padding(.horizontal)
            .padding(.vertical, 5)

            List(post.comments) { comment in
                HStack {
                    Image(systemName: comment.author.profilePicture)
                        .resizable()
                        .frame(width: 30, height: 30)
                    VStack(alignment: .leading) {
                        Text(comment.author.username)
                            .fontWeight(.bold)
                        Text(comment.text)
                    }
                }
            }
        }
        .padding()
    }

    var commentInputView: some View {
        HStack {
            TextField("Add a comment...", text: $commentContent)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                let newComment = Comment(
                    text: commentContent,
                    author: User(username: profileModel.username, profilePicture: "person.circle.fill", isFollowed: true)
                )
                posts[currentIndex].comments.append(newComment)
                commentContent = ""
                isAddingComment = false
            }) {
                Text("Comment")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.trailing)
        }
    }

    var buttonsView: some View {
        VStack {
            Button(action: {
                currentIndex = (currentIndex + 1) % posts.count
            }) {
                Text("Next Post")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Button("Edit Account") {
                isShowingProfile = true
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)

            Button("Tweet") {
                isShowingNewTweetView = true
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
        }
        .padding(.bottom, 20) // Add padding at the bottom to create some space
    }
}





#Preview {
    ContentView()
}
