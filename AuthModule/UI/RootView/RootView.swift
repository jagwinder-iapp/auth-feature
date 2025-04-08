//
//  RootView.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//

import SwiftUI

struct RootView: View {
    @State var navigationPath = NavigationPath()
    var body: some View {
        ZStack {
            NavigationStack(path: $navigationPath) {
                LandingPageView(navigationPath: $navigationPath)
                    .navigationDestination(for: NavigationDestination.self) { destination in
                        switch destination {
                        case .Login:
                            LoginView(navigationPath: $navigationPath)
                        case .SignUp:
                            SignUpView(navigationPath: $navigationPath)
                        case .FogotPassword:
                            ForgotPasswordView(navigationPath: $navigationPath)
                        case .Home:
                            HomeView(navigationPath: $navigationPath)
                        }
                    }
                    
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .tint(.customText)
        }
    }
}

#Preview {
    RootView()
}

enum NavigationDestination: Hashable {
    case Login
    case SignUp
    case FogotPassword
    case Home
}
