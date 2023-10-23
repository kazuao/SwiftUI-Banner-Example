//
//  BannerTemplate.swift
//  Banner-Example
//
//  Created by kazunori.aoki on 2023/10/23.
//

import SwiftUI

struct BannerTemplate: View {
    enum `Type` {
        case info
        case success
        case error
        case other(imageName: String)
    }
    var type: `Type`
    var text: String

    private var image: String {
        switch type {
        case .info:            return "info.circle"
        case .success:         return "checkmark.circle"
        case .error:           return "xmark.circle"
        case .other(var name): return name
        }
    }
    private var color: Color {
        switch type {
        case .info:    return .gray
        case .success: return .green
        case .error:   return .red
        case .other:   return .gray
        }
    }

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: image)
                .font(.system(size: 26))
                .foregroundColor(color)

            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 14))
        }
        .padding(16)
        .background(Color.white)
        .overlay(
            Rectangle()
                .stroke(.white.opacity(0.8), lineWidth: 1)
        )
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.05), radius: 16, x: 0, y: 8)
    }
}

extension Banner.Message {
    static func info(text: String) -> Self {
        .init(
            content: AnyView(BannerTemplate(type: .info, text: text)),
            config: .init(duration: 3, transition: .opacity, animation: .easeInOut(duration: 0.5))
        )
    }

    static func success(text: String) -> Self {
        .init(
            content: AnyView(BannerTemplate(type: .success, text: text)),
            config: .init(duration: 3, transition: .opacity, animation: .easeInOut(duration: 0.5))
        )
    }

    static func error(text: String) -> Self {
        .init(
            content: AnyView(BannerTemplate(type: .error, text: text)),
            config: .init(duration: 3, transition: .opacity, animation: .easeInOut(duration: 0.5))
        )
    }

    static func other(text: String, imageName: String) -> Self {
        .init(
            content: AnyView(BannerTemplate(type: .other(imageName: imageName), text: text)),
            config: .init(duration: 3, transition: .opacity, animation: .easeInOut(duration: 0.5))
        )
    }
}

struct BannerTemplate_Previews: PreviewProvider {
    static var previews: some View {
        BannerTemplate(type: .info, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
    }
}
