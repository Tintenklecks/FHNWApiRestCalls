import Foundation

class ViewModel: ObservableObject {
    @Published var joke: Joke? = nil

    func fetchData() {
        let model = Model()
        model.loadData()
        joke = model.joke
    }
}
