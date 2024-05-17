//
//  CreateAccountView.swift
//  mediaApp
//
//  Created by StudentAM on 5/14/24.
//

import SwiftUI

struct CreateAccountView: View {
    @ObservedObject var viewModel: AccountViewModel
    @Binding var isAccountCreated: Bool
    
    var body: some View {
        VStack {
            Text("Create Account").font(.headline).padding()
            TextField("Email", text: $viewModel.email)
            SecureField("Password", text: $viewModel.password)
            SecureField("Confirm Password", text: .constant(""))
            if let message = viewModel.errorMessage {
                Text(message).foregroundColor(.red)
            }
            Button("Create Account") {
                viewModel.createAccount(username: viewModel.username, email: viewModel.email, password: viewModel.password, confirmPassword: viewModel.password) { success in
                    isAccountCreated = success
                }
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
