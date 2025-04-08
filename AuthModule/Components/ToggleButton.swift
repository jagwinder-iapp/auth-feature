//
//  ToggleButton.swift
//  GithubDemo
//
//  Created by iapp on 04/04/25.
//
import SwiftUI

struct CustomToggleButton: View {
    @Binding var isOn: Bool
    var activeImage: String
    var inactiveImage: String
    var tintColor: Color = .gray
    var padding: CGFloat = 20
    var action: (() -> Void)? = nil

    var body: some View {
        Button(action: {
            isOn.toggle()
            action?()
        }) {
            Image(systemName: isOn ? activeImage : inactiveImage)
                .foregroundColor(tintColor)
        }
        .padding(.trailing, padding)
    }
}
