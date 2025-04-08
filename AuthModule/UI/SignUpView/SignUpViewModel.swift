//
//  SignUpViewModel.swift
//  GithubDemo
//
//  Created by iapp on 08/04/25.
//

import Foundation

class SignUpViewModel : ObservableObject {
    @Published var firstName : String = ""
    @Published var lastName : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var confirmPassword : String = ""
    @Published var isLoading : Bool = false
    @Published var showAlert : Bool = false
    @Published var errorMessage : String = ""
    @Published var showPassword : Bool = true
    @Published var showConfirmPassword : Bool = true
    
    func validateFields() -> Bool {
          // Check name fields
          guard !firstName.trimmingCharacters(in: .whitespaces).isEmpty else {
              showError(message: "First name cannot be empty.")
              return false
          }

          guard !lastName.trimmingCharacters(in: .whitespaces).isEmpty else {
              showError(message: "Last name cannot be empty.")
              return false
          }

          // Check email format
          guard isValidEmail(email) else {
              showError(message: "Please enter a valid email address.")
              return false
          }

          // Check password length
          guard password.count >= 8 else {
              showError(message: "Password must be at least 8 characters long.")
              return false
          }

          // Confirm password match
          guard password == confirmPassword else {
              showError(message: "Passwords do not match.")
              return false
          }

          return true
      }
    
    /// Check if email format is valid
      private func isValidEmail(_ email: String) -> Bool {
          let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
          let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
          return emailPredicate.evaluate(with: email)
      }

      /// Set error and trigger alert
      private func showError(message: String) {
          errorMessage = message
          showAlert = true
      }
}
