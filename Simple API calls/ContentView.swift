// Created 12.11.2023

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack(spacing: 18) {
            if let joke = viewModel.joke {
                Text(joke.setup)
                    .font(.headline)
                    .foregroundColor(.purple)
                Text(joke.punchline)
                    .font(.headline)
            } else {
                Text("Press the button for the next Joke")
            }
            Button("tell me a joke") {
                viewModel.fetchData()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
