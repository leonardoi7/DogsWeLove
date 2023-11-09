import SwiftUI

struct ContentView: View {
    let dogData: [DogData] = [
        DogData(dogName: "Chief", description: "Black (formerly) White with black spots, he don't trust anyone", age: 2, image: "Rex"),
        DogData(dogName: "Rex", description: "Black (formerly) White with black spots, he don't trust anyone", age: 2, image: "Rex"),
        DogData(dogName: "Rex", description: "Black (formerly) White with black spots, he don't trust anyone", age: 2, image: "Rex"),
        DogData(dogName: "Rex", description: "Black (formerly) White with black spots, he don't trust anyone", age: 2, image: "Rex"),
        DogData(dogName: "Rex", description: "Black (formerly) White with black spots, he don't trust anyone", age: 2, image: "Rex"),
        DogData(dogName: "Rex", description: "Black (formerly) White with black spots, he don't trust anyone", age: 2, image: "Rex"),
        DogData(dogName: "Rex", description: "Black (formerly) White with black spots, he don't trust anyone", age: 2, image: "Rex"),
        DogData(dogName: "Rex", description: "Black (formerly) White with black spots, he don't trust anyone", age: 2, image: "Rex"),
    ]
    
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
    }
}

#Preview {
    ContentView()
}
