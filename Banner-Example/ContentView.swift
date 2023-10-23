//
//  ContentView.swift
//  Banner-
//
//  Created by kazunori.aoki on 2023/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var banner = BannerMessage()

    var body: some View {
        VStack {
            Button("Show Toast") {
                banner.present(.success(text: "Success!"))
            }
            Button("Info Toast") {
                banner.present(.info(text: "Info!"))
            }
            Button("Show Toast") {
                banner.present(.error(text: "Error!"))
            }
        }
        .padding()
        .banner(
            banner,
            layout: .init(
                padding: .init(
                    top: 0,
                    leading: 16,
                    bottom: 16,
                    trailing: 16
                )
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

