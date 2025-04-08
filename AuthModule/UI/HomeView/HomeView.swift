//
//  HomeView.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//

import SwiftUI

struct HomeView: View {
    @Binding var navigationPath : NavigationPath
    
    var body: some View {
        VStack {
            Text(AppStrings.comingSoon)
                .font(.custom(AppFonts.bold, size: 16.0))
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView(navigationPath: .constant(NavigationPath()))
}
