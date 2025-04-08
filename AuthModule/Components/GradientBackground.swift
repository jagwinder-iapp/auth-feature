//
//  GradientBackground.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//
import SwiftUI

struct GradientBackground: View {
    var colors: [Color]
    var startPoint: UnitPoint = .top
    var endPoint: UnitPoint = .bottom

    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
            .edgesIgnoringSafeArea(.all)
    }
}
