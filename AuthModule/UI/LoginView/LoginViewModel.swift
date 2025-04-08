//
//  LoginViewModel.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//

import Foundation
import Combine

class LoginViewModel : ObservableObject {
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var showPassword : Bool = true
    @Published var isLoading : Bool = false
    @Published var showAlert : Bool = false
    @Published var errorMessage : String = ""
    
    
    /// Validates email and password.
    func validateFields() -> Bool {
        if !isValidEmail(email) {
            errorMessage = "Please enter a valid email address."
            showAlert = true
            return false
        }
        
        if password.count < 8 {
            errorMessage = "Password must be at least 8 characters long."
            showAlert = true
            return false
        }
        
        return true
    }
    
    /// Uses NSPredicate to validate email format.
    private func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return predicate.evaluate(with: email)
    }
}
