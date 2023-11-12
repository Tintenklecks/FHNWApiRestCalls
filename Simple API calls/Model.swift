// Created 12.11.2023

import Foundation

class Model {
    var joke: Joke?
    let urlString = "https://official-joke-api.appspot.com/random_joke"

    func loadData() {
        guard let url = URL(string: urlString) else {
            joke = Joke(type: "", setup: "Error", punchline: "Error converting the URL", id: 0)
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            joke = Joke(type: "", setup: "Error", punchline: "Error loading the data from the joke URL", id: 0)
            return
        }
        guard let joke  = try? JSONDecoder().decode(Joke.self, from: data) else {
            joke = Joke(type: "", setup: "Error", punchline: "Error loading the data from the joke URL", id: 0)
            return
        }
        self.joke = joke
    }
}
