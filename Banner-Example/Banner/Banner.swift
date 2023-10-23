//
//  Banner.swift
//  Banner-Example
//
//  Created by kazunori.aoki on 2023/10/23.
//

import SwiftUI

struct Banner: View {

    struct Message: Identifiable {
        var id: UUID = .init()
        var content: AnyView
        var config: Config
    }

    struct Config {
        var duration: TimeInterval
        var transition: AnyTransition
        var animation: Animation
    }

    struct Layout {
        var padding: EdgeInsets
    }
    
    var message: Message
    var layout: Layout
    var isPreview: Bool = false
    var onClose: () -> Void
    
    @State private var isShowing: Bool = false
    
    var body: some View {
        VStack {
            if isShowing {
                message.content
                    .onTapGesture {
                        isShowing = false
                    }
                    .onAppear {
                        guard !isPreview else { return }
                        
                        Task {
                            try? await Task.sleep(nanoseconds: UInt64(message.config.duration * 1_000_000_000))
                            isShowing = false
                            try? await Task.sleep(nanoseconds: UInt64(0.5 * 1_000_000_000))
                            
                            onClose()
                        }
                    }
            }

            Spacer()
        }
        .padding(layout.padding)
        .animation(message.config.animation, value: isShowing)
        .transition(message.config.transition)
        .onAppear {
            isShowing = true
        }
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner(
            message: .init(
                content: AnyView(
                    Text("Hello")
                        .padding(16)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)
                ),
                config: .init(
                    duration: 9999,
                    transition: .opacity,
                    animation: .linear
                )
            ),
            layout: .init(padding: .init(top: 0, leading: 16, bottom: 16, trailing: 16)),
            isPreview: true,
            onClose: {}
        )
    }
}
