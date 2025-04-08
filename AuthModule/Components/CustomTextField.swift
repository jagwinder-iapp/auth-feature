//
//  CustomTextField.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType
    var isSecure: Bool
    var strokeColor: Color
    var lineWidth: CGFloat
    
    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $text)
                .font(.custom(AppFonts.regular, size: 15.0))
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(strokeColor, lineWidth: lineWidth)
                )
                .cornerRadius(10)
        } else {
            TextField(placeholder, text: $text)
                .autocorrectionDisabled()
                .font(.custom(AppFonts.regular, size: 15.0))
                .keyboardType(keyboardType)
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(strokeColor, lineWidth: lineWidth)
                )
                .cornerRadius(10)
        }
    }
}
