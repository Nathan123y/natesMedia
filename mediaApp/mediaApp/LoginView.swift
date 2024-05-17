//
//  LoginView.swift
//  mediaApp
//
//  Created by StudentAM on 5/14/24.
//

import SwiftUI


struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var showingResetPassword = false

    var body: some View {
        VStack {
            VStack {
                Text("Login").font(.headline).padding()
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                Button("Log In") {
                    performLogin()
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("Invalid credentials"), dismissButton: .default(Text("OK")))
                }
                Button("Forgot Password?") {
                    self.showingResetPassword = true
                }
                .alert(isPresented: $showingResetPassword) {
                    Alert(
                        title: Text("Reset Password"),
                        message: Text("Enter your email to reset password."),
                        primaryButton: .default(Text("Send"), action: {
                            print("Reset link sent to \(email)")
                        }),
                        secondaryButton: .cancel()
                    )
                }
            }
            .padding()
            .background(Color.white.opacity(0.8))
            .cornerRadius(10)
            .padding()
        }
        .padding()
    }

    func performLogin() {
        let storedEmail = UserDefaults.standard.string(forKey: "UserEmail") ?? ""
        let storedPassword = UserDefaults.standard.string(forKey: "UserPassword") ?? ""
        if email == storedEmail && password == storedPassword {
            isLoggedIn = true
        } else {
            showingAlert = true
        }
    }
}



#Preview {
    ContentView()
}
