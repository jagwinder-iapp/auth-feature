//
//  ForgotPasswordView.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Binding var navigationPath : NavigationPath
    
    var body: some View {
        Text("Forgot Pasword")
    }
}

#Preview {
    ForgotPasswordView(navigationPath: .constant(NavigationPath()))
}
