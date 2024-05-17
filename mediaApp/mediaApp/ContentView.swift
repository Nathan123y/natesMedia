//
//  ContentView.swift
//  mediaApp
//
//  Created by StudentAM on 4/25/24.
//

//  ContentView.swift
//  mediaApp
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI




struct ContentView: View {
    @StateObject var viewModel = AccountViewModel()
    @State private var isAccountCreated = false
    @State private var isLoggedIn = false
    @State private var isShowingProfile = false

    @StateObject private var profileModel = ProfileModel(username: "TestUser", displayName: "Display Name", nickname: "Nickname")

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                if !isAccountCreated {
                    createAccountView
                } else if !isLoggedIn {
                    LoginView(isLoggedIn: $isLoggedIn)
                } else if isShowingProfile {
                    ProfilePageView(isShowingProfile: $isShowingProfile, profileModel: profileModel)
                } else {
                    HomeView(isShowingProfile: $isShowingProfile, profileModel: profileModel)
                }
            }
        }
    }

    var createAccountView: some View {
        VStack {
            Text("Create Account").font(.headline).padding()
            TextField("Username", text: $viewModel.username)
            TextField("Email", text: $viewModel.email)
            SecureField("Password", text: $viewModel.password)
            SecureField("Confirm Password", text: .constant(""))
            if let message = viewModel.errorMessage {
                Text(message).foregroundColor(.red)
            }
            Button("Create Account") {
                viewModel.createAccount(username: viewModel.username, email: viewModel.email, password: viewModel.password, confirmPassword: viewModel.password) { success in
                    if success {
                        isAccountCreated = true
                    }
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}









#Preview {
    ContentView()
}
