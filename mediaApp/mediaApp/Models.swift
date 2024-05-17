//
//  Models.swift
//  mediaApp
//
//  Created by StudentAM on 5/15/24.
//



import Foundation

struct Post: Identifiable {
    let id = UUID()
    var content: String
    var author: User
    var likes: Int
    var comments: [Comment]
}

struct User: Identifiable {
    let id = UUID()
    var username: String
    var profilePicture: String
    var isFollowed: Bool = true // Default value set to true
}

struct Comment: Identifiable {
    let id = UUID()
    var text: String
    var author: User
}

let usernames = ["AliceSmith", "BobJones", "CharlieBrown", "DavidJohnson", "EmilyDavis",
                 "FrankWilson", "GraceMartinez", "HenryTaylor", "IsabellaAnderson", "JackThomas",
                 "KatherineWhite", "LiamHarris", "MiaClark", "NoahLewis", "OliviaMartin",
                 "PatrickWalker", "QuinnAllen", "RachelYoung", "SamuelKing", "TaylorScott"]

let examplePostContents = [
    "Just had the best coffee ever!", "Lovely weather today.", "Learning Swift is fun!",
    "I just finished a great book.", "Happy to be part of this community.",
    "Anyone else excited for the weekend?", "Check out this amazing view!",
    "Feeling grateful today.", "Let's start this week with positivity.",
    "Had a great workout session.", "Enjoying some delicious pizza right now.",
    "Excited to explore new places this weekend.", "Celebrating my birthday with friends and family.",
    "Finished a challenging project today.", "Reflecting on the past year's achievements.",
    "Looking forward to upcoming travel plans.", "Trying out a new recipe for dinner tonight.",
    "Feeling inspired after attending a workshop.", "Just adopted a new pet!",
    "Spending quality time with loved ones."
]

let exampleCommentContents = [
    "That's awesome!", "I totally agree.", "Sounds great!", "Thanks for sharing.", "Very interesting!",
    "Can't wait to try this.", "Looks amazing!", "I'm so happy for you.", "Absolutely!", "Well said!",
    "Congratulations!", "Wishing you a fantastic time!", "Happy birthday!", "Great job!",
    "Keep up the good work!", "You deserve it!", "Bon appétit!", "You're an inspiration!",
    "So cute!", "Cherish those moments."
]

let samplePosts: [Post] = (1...20).map { _ in
    let randomUsername = usernames[Int.random(in: 0..<usernames.count)]
    let randomPostContent = examplePostContents[Int.random(in: 0..<examplePostContents.count)]
    let comments = (1...5).map { _ in
        Comment(
            text: exampleCommentContents[Int.random(in: 0..<exampleCommentContents.count)],
            author: User(username: usernames[Int.random(in: 0..<usernames.count)], profilePicture: "person.circle.fill", isFollowed: true)
        )
    }
    return Post(
        content: randomPostContent,
        author: User(username: randomUsername, profilePicture: "person.circle.fill", isFollowed: true),
        likes: Int.random(in: 0...1000),
        comments: comments
    )
}
