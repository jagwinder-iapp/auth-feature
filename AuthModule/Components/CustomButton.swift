//
//  CustomButton.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//


import SwiftUI

struct CustomButton: View {
    var title: String
    var isLoading: Bool
    var isEnabled: Bool
    var cornerRadius: CGFloat
    var width : CGFloat
    var action: () -> Void

    var body: some View {
        Button(action: {
            if isEnabled { action() }
        }) {
            Group {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.2)
                } else {
                    Text(title)
                        .foregroundColor(.customText)
                        .font(.custom(AppFonts.bold, size: 16.0))
                }
            }
            .frame(maxWidth: width)
            .padding()
            .background(isEnabled ? .customBgButtonFill : Color.gray.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(cornerRadius)
        }
        .disabled(!isEnabled)
    }
}


