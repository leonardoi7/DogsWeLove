import SwiftUI

struct ContentView: View {
    @State private var dogData: [DogData] = []
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Dogs")) {
                    NavigationLink(destination: DogList(dogData: dogData)) {
                        Text("View All Dogs")
                    }
                }
            }
        }
        .navigationTitle("Dogs We Love")
        .onAppear {
            loadData()
        }
    }
    
    func loadData() {
        let storedDogs = DataManager.shared.fetchDogs()
        if storedDogs.isEmpty {
            #if DEBUG
            print("No stored dogs found, fetching from API")
            #endif
            APIManager.shared.fetchDogs { dogs, error in
                if let dogs = dogs {
                    self.dogData = dogs
                    saveDogsToCoreData(dogs)
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        } else {
            #if DEBUG
            print("Found \(storedDogs.count) stored dogs")
            #endif
            self.dogData = convertToDogDataArray(from: storedDogs)
        }
    }
}

#Preview {
    ContentView()
}
