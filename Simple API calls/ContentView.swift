// Created 12.11.2023

import SwiftUI

struct ContentView: View {
    // MARK: Internal

    let urlString = "https://official-joke-api.appspot.com/random_joke"

    @State private var responseText = "Hello, world!"

    var body: some View {
        VStack(spacing: 18) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text(responseText)
                .lineLimit(10)
            
            Button("tell me a joke") {
                guard let url = URL(string: urlString) else {
                    responseText = "Somethoing went wrong"
                    return
                }
                guard let data = try? Data(contentsOf: url) else {
                    responseText = "Somethoing went wrong"
                    return
                }
                guard let resultString = String(data: data, encoding: .utf8) else {
                    responseText = "Somethoing went wrong"
                    return
                }
                responseText = resultString
            }
        }
        
    }

}

#Preview {
    ContentView()
}
