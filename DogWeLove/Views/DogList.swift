import SwiftUI

struct DogList: View {
    let dogData: [DogData]
    
    var body: some View {
            ZStack {
                Color(.secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVStack {
                        ForEach(dogData) { dog in
                            NavigationLink(destination: DogDetail(dogData: dog)) {
                                DogCell(dogData: dog)
                                    .background(Color(.secondarySystemBackground))
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                            }
                        }
                    }
                }
            }
        .navigationTitle("Dogs We Love")
    }
}

#Preview {
    let dogData: [DogData] = [
        DogData(dogName: "Chief", description: "Black (formerly) White with black spots, he don't trust anyone", age: 2, image: "Rex"),
    ]
    return DogList(dogData: dogData)
}
