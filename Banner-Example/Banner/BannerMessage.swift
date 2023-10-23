//
//  BannerMessage.swift
//  Banner-Example
//
//  Created by kazunori.aoki on 2023/10/23.
//

import SwiftUI

final class BannerMessage: ObservableObject {
    @Published var messages: [Banner.Message] = []

    init() {}

    func present(_ message: Banner.Message) {
        messages.append(message)
    }

    func remove(_ message: Banner.Message) {
        messages.removeAll { $0.id == message.id }
    }
}
