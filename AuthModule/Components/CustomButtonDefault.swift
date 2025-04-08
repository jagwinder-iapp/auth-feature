//
//  CustomButtonDefault.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//

import SwiftUI
struct CustomButtonDefault : View {
    var title: String
    var isEnabled: Bool
    var fontSize: CGFloat
    var textColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            if isEnabled { action() }
        }) {
            Text(title)
                .font(.custom(AppFonts.semiBold, size: fontSize))
                .foregroundColor(textColor)
        }
        .disabled(!isEnabled)
    }
}
