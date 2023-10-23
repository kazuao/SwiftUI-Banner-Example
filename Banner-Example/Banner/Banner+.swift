//
//  Banner+.swift
//  Banner-Example
//
//  Created by kazunori.aoki on 2023/10/23.
//

import SwiftUI

extension View {
    func banner(_ messages: BannerMessage, layout: Banner.Layout) -> some View {
        modifier(BannerModifier(messages: messages, layout: layout))
    }
}

struct BannerModifier: ViewModifier {
    @ObservedObject var messages: BannerMessage

    var layout: Banner.Layout

    @ViewBuilder
    func body(content: Content) -> some View {
        ZStack {
            content

            ForEach(messages.messages) { message in
                Banner(
                    message: message,
                    layout: layout,
                    onClose: { messages.remove(message) })
            }
        }
    }
}
