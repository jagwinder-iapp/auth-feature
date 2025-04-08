//
//  LoginView.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//

import SwiftUI

/// A view that provides the user interface for user login.
struct LoginView: View {
    
    /// Binding to the navigation path used for navigating between views.
    @Binding var navigationPath: NavigationPath
    
    /// ViewModel responsible for handling login logic.
    @StateObject private var loginViewModel: LoginViewModel = LoginViewModel()
    
    /// Constants used for styling and layout.
    private enum Constants {
        static let titleFontSize: CGFloat = 35
        static let verticalSpacing: CGFloat = 20
        static let topPaddingTitle: CGFloat = 80
        static let horizontalPaddingFields: CGFloat = 30
        static let toggleFieldCornerRadius: CGFloat = 10
        static let forgotPasswordFontSize: CGFloat = 14
        static let horizontalPaddingButtons: CGFloat = 40
        static let signUpFontSize: CGFloat = 16
        static let signUpTopPadding: CGFloat = 10
        static let signUpBottomPadding: CGFloat = 40
        static let scrollTopPadding: CGFloat = 20
        static let forgotPasswordTopPadding: CGFloat = -10
        static let buttonCornerRadius: CGFloat = 10
    }
    
    var body: some View {
        ZStack {
            // Background gradient
            GradientBackground(colors: [Color.customPurple, Color.customBlue])
            
            ScrollView {
                VStack(spacing: Constants.verticalSpacing) {
                    
                    // App title or logo
                    Text(AppStrings.login)
                        .font(.custom(AppFonts.bold, size: Constants.titleFontSize))
                        .padding(.top, Constants.topPaddingTitle)
                    
                    Spacer()
                    
                    // Login form fields
                    VStack(spacing: Constants.verticalSpacing) {
                        
                        // Email field
                        CustomTextField(
                            placeholder: AppStrings.email,
                            text: $loginViewModel.email,
                            keyboardType: .emailAddress,
                            isSecure: false,
                            strokeColor: Color.clear,
                            lineWidth: 1
                        )
                        
                        // Password field with toggle button
                        HStack {
                            CustomTextField(
                                placeholder: AppStrings.password,
                                text: $loginViewModel.password,
                                keyboardType: .default,
                                isSecure: loginViewModel.showPassword,
                                strokeColor: Color.clear,
                                lineWidth: 1
                            )
                            
                            CustomToggleButton(
                                isOn: $loginViewModel.showPassword,
                                activeImage: AppImages.eyeClose,
                                inactiveImage: AppImages.eyeOpen
                            )
                        }
                        .background(Color.white)
                        .cornerRadius(Constants.toggleFieldCornerRadius)
                    }
                    .padding(.horizontal, Constants.horizontalPaddingFields)
                    
                    // Forgot password button
                    HStack {
                        Spacer()
                        CustomButtonDefault(
                            title: AppStrings.forgotPassword,
                            isEnabled: true,
                            fontSize: Constants.forgotPasswordFontSize,
                            textColor: .customText
                        ) {
                            navigationPath.append(NavigationDestination.FogotPassword)
                        }
                    }
                    .padding(.top, Constants.forgotPasswordTopPadding)
                    .padding(.horizontal, Constants.horizontalPaddingButtons)
                    
                    // Login button
                    CustomButton(
                        title: AppStrings.login,
                        isLoading: loginViewModel.isLoading,
                        isEnabled: true,
                        cornerRadius: Constants.buttonCornerRadius,
                        width: .infinity
                    ) {
                        if loginViewModel.validateFields() {
                            loginViewModel.isLoading.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                navigationPath.append(NavigationDestination.Home)
                                loginViewModel.isLoading.toggle()
                            }
                        }
                    }
                    .padding(.horizontal, Constants.horizontalPaddingButtons)
                    
                    // Sign-up prompt
                    HStack {
                        Text(AppStrings.doNotHaveAccount)
                            .font(.custom(AppFonts.regular, size: Constants.signUpFontSize))
                        
                        CustomButtonDefault(
                            title: AppStrings.signUp,
                            isEnabled: true,
                            fontSize: Constants.signUpFontSize,
                            textColor: .customText
                        ) {
                            navigationPath.append(NavigationDestination.SignUp)
                        }
                    }
                    .padding(.top, Constants.signUpTopPadding)
                    .padding(.bottom, Constants.signUpBottomPadding)
                }
                .padding(.top, Constants.scrollTopPadding)
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .alert(isPresented: $loginViewModel.showAlert) {
            Alert(
                title: Text(AppStrings.error),
                message: Text(loginViewModel.errorMessage),
                dismissButton: .default(Text(AppStrings.ok))
            )
        }
    }
}

#Preview {
    // Preview for the login view with a constant navigation path.
    LoginView(navigationPath: .constant(NavigationPath()))
}

