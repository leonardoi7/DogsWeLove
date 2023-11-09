import SwiftUI

struct ContentView: View {
    @State private var dogData: [DogData] = []
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Favorites")) {
                    NavigationLink(destination: EmptyView()) {
                        Text("Rex")
                    }
                    NavigationLink(destination: EmptyView()) {
                        Text("Chief")
                    }
                    
                }
                Section(header: Text("Dogs")) {
                    NavigationLink(destination: DogList(dogData: dogData)) {
                        Text("View All Dogs")
                    }
                }
            }
        }
        .navigationTitle("Dogs We Love")
        .onAppear {
            APIManager.shared.fetchDogs { dogs, error in
                if let dogs = dogs {
                    dogData = dogs
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
