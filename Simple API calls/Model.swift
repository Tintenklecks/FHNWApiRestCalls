// Created 12.11.2023

import Foundation

// MARK: - API

enum API {
    case random

    // MARK: Internal

    var urlString: String {
        switch self {
        case .random: "https://official-joke-api.appspot.com/random_joke"
        }
    }
    
    var url: URL {
        guard let url = URL(string:  urlString) else {
            fatalError("Something is wrong with the URL \(urlString)")
        }
        return url
    }
}

class APIService {
    
    func fetch(endpoint: API) -> Data? {
        
        guard let data = try? Data(contentsOf: endpoint.url) else {
            return nil
        }
        
        return data

        
    }
    
}


class Model {
    var joke: Joke?

        func loadData()
    {
        guard let data = try? Data(contentsOf: API.random.url) else {
            joke = Joke(type: "", setup: "Error", punchline: "Error loading the data from the joke URL", id: 0)
            return
        }
        guard let joke = try? JSONDecoder().decode(Joke.self, from: data) else {
            joke = Joke(type: "", setup: "Error", punchline: "Error loading the data from the joke URL", id: 0)
            return
        }
        self.joke = joke
    }
}
