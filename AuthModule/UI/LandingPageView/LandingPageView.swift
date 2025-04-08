//
//  LandingPageView.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//

import SwiftUI

/// A view that displays the landing screen with login and sign-up options.
struct LandingPageView: View {
    
    /// Binding to the navigation path used for navigation.
    @Binding var navigationPath: NavigationPath
    
    /// Constants used for styling the view.
    private enum Constants {
        static let titleFontSize: CGFloat = 35
        static let spacing: CGFloat = 12
        static let buttonCornerRadius: CGFloat = 30
        static let loginButtonWidth: CGFloat = 180
        static let signupButtonWidth: CGFloat = 220
        static let shadowRadius: CGFloat = 10
        static let shadowYOffset: CGFloat = 4
        static let titleTopPadding: CGFloat = 20
    }
    
    var body: some View {
        ZStack {
            // Background gradient
            GradientBackground(colors: [.customPurple, .customBlue])
            
            VStack(spacing: Constants.spacing) {
                
                // App title
                VStack{
                    Text(AppStrings.demo)
                        .font(.custom(AppFonts.bold, size: Constants.titleFontSize))
                        .foregroundColor(Color.white)
                        .shadow(
                            color: .customText.opacity(0.2),
                            radius: Constants.shadowRadius,
                            x: Constants.shadowYOffset,
                            y: Constants.shadowYOffset
                        )
                }.padding(.top,Constants.titleTopPadding)
                
                Spacer()
                
                // Login button
                CustomButton(
                    title: AppStrings.login,
                    isLoading: false,
                    isEnabled: true,
                    cornerRadius: Constants.buttonCornerRadius,
                    width: Constants.loginButtonWidth
                ) {
                    navigationPath.append(NavigationDestination.Login)
                }
                
                // Sign-up button
                CustomButton(
                    title: AppStrings.signUpAsUser,
                    isLoading: false,
                    isEnabled: true,
                    cornerRadius: Constants.buttonCornerRadius,
                    width: Constants.signupButtonWidth
                ) {
                    navigationPath.append(NavigationDestination.SignUp)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    // Preview for LandingPageView with a constant navigation path.
    LandingPageView(navigationPath: .constant(NavigationPath()))
}
