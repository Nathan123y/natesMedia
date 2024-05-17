//
//  AccountViewModel.swift
//  mediaApp
//
//  Created by StudentAM on 5/14/24.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    
    func createAccount(username: String, email: String, password: String, confirmPassword: String, completion: @escaping (Bool) -> Void) {
        if email.isEmpty || password.isEmpty || username.isEmpty || confirmPassword.isEmpty {
            errorMessage = "All fields must be filled."
            completion(false)
            return
        }
        
        if password != confirmPassword {
            errorMessage = "Passwords do not match."
            completion(false)
            return
        }
        
        // Simulating successful account creation after validation checks
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UserDefaults.standard.set(email, forKey: "UserEmail")
            UserDefaults.standard.set(password, forKey: "UserPassword")
            completion(true)
        }
    }
}

#Preview {
    ContentView()
}
