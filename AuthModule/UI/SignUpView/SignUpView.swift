//
//  SignUpView.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//

import SwiftUI

struct SignUpView: View {
    @Binding var navigationPath: NavigationPath
    @StateObject private var signUpViewModel = SignUpViewModel()

    // MARK: - Constants
    private enum Constants {
        static let headingFontSize: CGFloat = 35
        static let topPadding: CGFloat = 30
        static let fieldSpacing: CGFloat = 16
        static let cornerRadius: CGFloat = 10
        static let horizontalPadding: CGFloat = 20
        static let buttonTopPadding: CGFloat = 20
        static let backgroundColors: [Color] = [Color.customPurple, Color.customBlue]
        static let passwordLineWidth: CGFloat = 1
        static let delayAfterValidation: TimeInterval = 2.0
    }

    var body: some View {
        ZStack {
            // Background gradient
            GradientBackground(colors: Constants.backgroundColors)
            
            ScrollView {
                // Heading
                Text(AppStrings.signUp)
                    .font(.custom(AppFonts.bold, size: Constants.headingFontSize))
                    .padding(.top, Constants.topPadding)
                
                VStack(spacing: Constants.fieldSpacing) {
                    
                    // First Name Field
                    CustomTextField(
                        placeholder: AppStrings.firstName,
                        text: $signUpViewModel.firstName,
                        keyboardType: .emailAddress,
                        isSecure: false,
                        strokeColor: .clear,
                        lineWidth: 0
                    )
                    
                    // Last Name Field
                    CustomTextField(
                        placeholder: AppStrings.lastName,
                        text: $signUpViewModel.lastName,
                        keyboardType: .emailAddress,
                        isSecure: false,
                        strokeColor: .clear,
                        lineWidth: 0
                    )
                    
                    // Email Field
                    CustomTextField(
                        placeholder: AppStrings.email,
                        text: $signUpViewModel.email,
                        keyboardType: .emailAddress,
                        isSecure: false,
                        strokeColor: .clear,
                        lineWidth: 0
                    )
                    
                    // Password Field with visibility toggle
                    HStack {
                        CustomTextField(
                            placeholder: AppStrings.password,
                            text: $signUpViewModel.password,
                            keyboardType: .default,
                            isSecure: signUpViewModel.showPassword,
                            strokeColor: .clear,
                            lineWidth: Constants.passwordLineWidth
                        )
                        
                        CustomToggleButton(
                            isOn: $signUpViewModel.showPassword,
                            activeImage: AppImages.eyeClose,
                            inactiveImage: AppImages.eyeOpen
                        )
                    }
                    .background(Color.white)
                    .cornerRadius(Constants.cornerRadius)
                    
                    // Confirm Password Field with visibility toggle
                    HStack {
                        CustomTextField(
                            placeholder: AppStrings.confirmPasword,
                            text: $signUpViewModel.confirmPassword,
                            keyboardType: .default,
                            isSecure: signUpViewModel.showConfirmPassword,
                            strokeColor: .clear,
                            lineWidth: Constants.passwordLineWidth
                        )
                        
                        CustomToggleButton(
                            isOn: $signUpViewModel.showConfirmPassword,
                            activeImage: AppImages.eyeClose,
                            inactiveImage: AppImages.eyeOpen
                        )
                    }
                    .background(Color.white)
                    .cornerRadius(Constants.cornerRadius)
                    
                    // Sign Up Button
                    CustomButton(
                        title: AppStrings.signUp,
                        isLoading: signUpViewModel.isLoading,
                        isEnabled: true,
                        cornerRadius: Constants.cornerRadius,
                        width: .infinity
                    ) {
                        if signUpViewModel.validateFields() {
                            signUpViewModel.isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + Constants.delayAfterValidation) {
                                navigationPath.append(NavigationDestination.Home)
                                signUpViewModel.isLoading = false
                            }
                        }
                    }
                    .padding(.top, Constants.buttonTopPadding)
                    
                }
                .padding(.horizontal, Constants.horizontalPadding)
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .alert(isPresented: $signUpViewModel.showAlert) {
            Alert(
                title: Text(AppStrings.error),
                message: Text(signUpViewModel.errorMessage),
                dismissButton: .default(Text(AppStrings.ok))
            )
        }
    }
}

#Preview {
    SignUpView(navigationPath: .constant(NavigationPath()))
}
